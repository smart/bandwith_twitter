
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/universal-darwin9.0
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
prefix = $(DESTDIR)/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr
exec_prefix = $(prefix)
sitedir = $(DESTDIR)/Library/Ruby/Site
rubylibdir = $(libdir)/ruby/$(ruby_version)
docdir = $(datarootdir)/doc/$(PACKAGE)
dvidir = $(docdir)
datarootdir = $(prefix)/share
archdir = $(rubylibdir)/$(arch)
sbindir = $(exec_prefix)/sbin
psdir = $(docdir)
localedir = $(datarootdir)/locale
htmldir = $(docdir)
datadir = $(datarootdir)
includedir = $(prefix)/include
infodir = $(DESTDIR)/usr/share/info
sysconfdir = $(prefix)/etc
mandir = $(DESTDIR)/usr/share/man
libdir = $(exec_prefix)/lib
sharedstatedir = $(prefix)/com
oldincludedir = $(DESTDIR)/usr/include
pdfdir = $(docdir)
sitearchdir = $(sitelibdir)/$(sitearch)
bindir = $(exec_prefix)/bin
localstatedir = $(prefix)/var
sitelibdir = $(sitedir)/$(ruby_version)
libexecdir = $(exec_prefix)/libexec

CC = gcc
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)

RUBY_EXTCONF_H = 
CFLAGS   =  -fno-common -arch i386 -Os -pipe -fno-common  -g -DXP_UNIX -O3 -Wall -Wcast-qual -Wwrite-strings -Wconversion -Wmissing-noreturn -Winline 
INCFLAGS = -I. -I. -I/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/universal-darwin9.0 -I.
DEFS     = 
CPPFLAGS =  -I/opt/local/include/ -I/opt/local/include/libxml2 -I/opt/local/include  
CXXFLAGS = $(CFLAGS) 
DLDFLAGS = -L. -arch i386  
LDSHARED = cc -arch i386 -pipe -bundle -undefined dynamic_lookup
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = universal-darwin9.0
sitearch = universal-darwin9.0
ruby_version = 1.8
ruby = /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir) /opt/local/lib
LIBPATH =  -L. -L$(libdir) -L/opt/local/lib
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = /nokogiri
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED) -lexslt -lxslt -lxml2  -lpthread -ldl -lm  
SRCS = html_document.c html_element_description.c html_entity_lookup.c html_sax_parser.c nokogiri.c xml_attr.c xml_cdata.c xml_comment.c xml_document.c xml_document_fragment.c xml_dtd.c xml_entity_reference.c xml_io.c xml_namespace.c xml_node.c xml_node_set.c xml_processing_instruction.c xml_reader.c xml_relax_ng.c xml_sax_parser.c xml_sax_push_parser.c xml_schema.c xml_syntax_error.c xml_text.c xml_xpath.c xml_xpath_context.c xslt_stylesheet.c
OBJS = html_document.o html_element_description.o html_entity_lookup.o html_sax_parser.o nokogiri.o xml_attr.o xml_cdata.o xml_comment.o xml_document.o xml_document_fragment.o xml_dtd.o xml_entity_reference.o xml_io.o xml_namespace.o xml_node.o xml_node_set.o xml_processing_instruction.o xml_reader.o xml_relax_ng.o xml_sax_parser.o xml_sax_push_parser.o xml_schema.o xml_syntax_error.o xml_text.o xml_xpath.o xml_xpath_context.o xslt_stylesheet.o
TARGET = nokogiri
DLLIB = $(TARGET).bundle
EXTSTATIC = 
STATIC_LIB = 

RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /Users/ttilley/fresh_app/vendor/gems/nokogiri-1.3.0/lib$(target_prefix)
RUBYARCHDIR = /Users/ttilley/fresh_app/vendor/gems/nokogiri-1.3.0/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).bundle $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS)
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h
