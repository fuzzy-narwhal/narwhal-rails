module PostsHelper

  def section_link(section_name)
    link_to section_name, url_for(:section=>section_name.downcase)
  end
  
end
