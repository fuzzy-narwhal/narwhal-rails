class Post < ActiveRecord::Base
  belongs_to :page

  def Post.find_with_events
    Post.find_by_sql('select * from posts where link_url like "http://www.facebook.com/event.php?eid=%"')
  end
  
  scope :recent, order("created_time desc")
  
  scope :for_section, lambda {|section|
    if section
      section = Section.find_by_name_or_id(section) || 0
      joins(:page).where(:pages=>{:section_id=>section})
    end
  }
  
  scope :for_category, lambda {|category|
    if category
      category = Category.find_by_name_or_id(category) || 0
      joins(:page=>:categories_pages).where(:categories_pages=>{:category_id=>category})
    end
  }
end


# == Schema Information
#
# Table name: posts
#
#  id               :integer         not null, primary key
#  likes            :integer
#  post_id          :string(255)
#  from             :string(255)
#  to               :string(255)
#  message          :string(255)
#  picture          :string(255)
#  link_url         :string(255)
#  link_name        :string(255)
#  link_caption     :string(255)
#  link_description :string(255)
#  movie_url        :string(255)
#  icon             :string(255)
#  attribution      :string(255)
#  created_time     :datetime
#  updated_time     :datetime
#  comments         :integer
#  created_at       :datetime
#  updated_at       :datetime
#  page_id          :integer
#

