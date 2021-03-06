#include <xml_schema.h>

static void dealloc(xmlSchemaPtr schema)
{
  NOKOGIRI_DEBUG_START(schema);
  xmlSchemaFree(schema);
  NOKOGIRI_DEBUG_END(schema);
}

/*
 * call-seq:
 *  validate_document(document)
 *
 * Validate a Nokogiri::XML::Document against this Schema.
 */
static VALUE validate_document(VALUE self, VALUE document)
{
  xmlDocPtr doc;
  xmlSchemaPtr schema;

  Data_Get_Struct(self, xmlSchema, schema);
  Data_Get_Struct(document, xmlDoc, doc);

  VALUE errors = rb_ary_new();

  xmlSchemaValidCtxtPtr valid_ctxt = xmlSchemaNewValidCtxt(schema);

  if(NULL == valid_ctxt) {
    // we have a problem
    rb_raise(rb_eRuntimeError, "Could not create a validation context");
  }

  if (! is_2_6_16()) {
    xmlSchemaSetValidStructuredErrors(
      valid_ctxt,
      Nokogiri_error_array_pusher,
      (void *)errors
    );
  }

  xmlSchemaValidateDoc(valid_ctxt, doc);

  xmlSchemaFreeValidCtxt(valid_ctxt);

  return errors;
}

/*
 * call-seq:
 *  read_memory(string)
 *
 * Create a new Schema from the contents of +string+
 */
static VALUE read_memory(VALUE klass, VALUE content)
{

  xmlSchemaParserCtxtPtr ctx = xmlSchemaNewMemParserCtxt(
      (const char *)StringValuePtr(content),
      RSTRING_LEN(content)
  );

  VALUE errors = rb_ary_new();
  xmlSetStructuredErrorFunc((void *)errors, Nokogiri_error_array_pusher);

  if (! is_2_6_16()) {
    xmlSchemaSetParserStructuredErrors(
      ctx,
      Nokogiri_error_array_pusher,
      (void *)errors
    );
  }

  xmlSchemaPtr schema = xmlSchemaParse(ctx);

  xmlSetStructuredErrorFunc(NULL, NULL);
  xmlSchemaFreeParserCtxt(ctx);

  if(NULL == schema) {
    xmlErrorPtr error = xmlGetLastError();
    if(error)
      rb_funcall(rb_mKernel, rb_intern("raise"), 1,
          Nokogiri_wrap_xml_syntax_error((VALUE)NULL, error)
      );
    else
      rb_raise(rb_eRuntimeError, "Could not parse document");

    return Qnil;
  }

  VALUE rb_schema = Data_Wrap_Struct(klass, 0, dealloc, schema);
  rb_iv_set(rb_schema, "@errors", errors);

  return rb_schema;
}

VALUE cNokogiriXmlSchema;
void init_xml_schema()
{
  VALUE nokogiri = rb_define_module("Nokogiri");
  VALUE xml = rb_define_module_under(nokogiri, "XML");
  VALUE klass = rb_define_class_under(xml, "Schema", rb_cObject);

  cNokogiriXmlSchema = klass;

  rb_define_singleton_method(klass, "read_memory", read_memory, 1);
  rb_define_private_method(klass, "validate_document", validate_document, 1);
}
