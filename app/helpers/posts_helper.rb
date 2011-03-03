module PostsHelper

  def section_link(section_name)
    link_to section_name, url_for(:section=>section_name.downcase)
  end
  
  def category_link(category_name)
    if params[:category] == category_name
      category_name.titleize
    else
      link_to category_name.titleize, url_for(params.merge(:category=>category_name.downcase))
    end
  end
  
end
