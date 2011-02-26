class Page < ActiveRecord::Base
  has_many :posts
  has_many :categories_pages
  has_many :categories, :through=>:categories_pages
  
  before_save :store_category_tags
  
  def category_tags
    @category_tags ||= self.categories.map(&:name) 
  end
  
  # Assign categories to the page using the category name 
  # Accepts either an array of strings or a single string with comma separated names (used by the form)
  def category_tags=(tags)
    tags = tags.split(',') if tags.is_a?(String)
    @category_tags = tags.map(&:downcase).map(&:strip).reject(&:empty?)
  end
  
  private
  
  def store_category_tags
    self.categories = @category_tags.map{|tag| Category.find_or_create_by_name(tag)} if @category_tags
  end
      

end

# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  page_id    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

