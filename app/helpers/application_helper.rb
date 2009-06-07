module ApplicationHelper
  def page_title
    (@title ||= @content_for_title) ? h(@title) : "My Page"
  end
  
  def site_name
    (@site_name ||= @content_for_site_name) ? h(@site_name) : "My Site"
  end
  
  def copyright_text
    return @copyright_text if instance_variable_defined?("@copyright_text")
    current_year = Date.current.year
    @copyright_text = "Copyright &copy; #{current_year} #{site_name}"
  end
  
  def navitems
    yield NavItem.new(self)
  end
end