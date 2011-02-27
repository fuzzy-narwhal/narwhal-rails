class Post < ActiveRecord::Base
  belongs_to :page
  
  scope :recent, order("created_at desc")
  
  scope :for_category, lambda {|category|
    category = Category.find_by_name(category.downcase) if category.is_a?(String)
    joins(:page=>:categories_pages).where(:categories_pages=>{:category_id=>category})
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

