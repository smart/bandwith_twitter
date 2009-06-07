class NavItem
  def initialize(context)
    @context = context
  end
  
  def method_missing(meth, url_options={}, html_options={})
    @name = meth.to_s.titlecase
    @url = url_options.is_a?(String) ? url_options : @context.url_for(url_options.merge(:only_path => true))
    
    active = block_given? ? yield : matches
    html_options[:class] = [(active ? 'active' : 'inactive'), html_options[:class]].join(' ')
    
    @context.content_tag(:li, @context.link_to(@name, @url), html_options)
  end
  
  def matches
    path_params = @context.request.path_parameters
    current_url = @context.url_for(path_params.merge(:only_path => true))
    @url == current_url
  end
end
