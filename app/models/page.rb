class Page < ActiveRecord::Base
  has_many :posts
  has_many :categories_pages
  has_many :categories, :through=>:categories_pages
  belongs_to :section
  
  before_save :store_category_tags

  def self.get_recommendations(category)
    recommended_pages = {}
    
    # get page likes limit 25
    loved_pages = Page.order("likes").limit(25)
    loved_pages.each do |lpage|
      recommended_pages[lpage] ||= 0
      recommended_pages[lpage] += 8
    end
    
    # get posts sorted by likes limit 25
    loved_posts = Post.order("likes").limit(25)
    loved_posts.each do |lpost|
      page = Page.find(lpost.page_id)
      if recommended_pages[page].nil?
        recommended_pages[page] ||= 0
      end
      recommended_pages[page] += 4
    end
    
    # get page by number of posts limit 25
    active_pages = Post.find(:all, :select => 'count(page_id) count, page_id', :order => 'count desc', :limit => 25, :group => 'page_id')
    active_pages.each do |pagepost|
      page2 = Page.find(pagepost.page_id)
      if recommended_pages[page2].nil?
        recommended_pages[page2] ||= 0
      end
      recommended_pages[page2] += 2
    end
    
    # get posts sorted by comment counts limit 25
    active_posts = Post.order('comments').limit(25)
    active_posts.each do |apost|
      page3= Page.find(apost.page_id)
      if recommended_pages[page3].nil?
        recommended_pages[page3] ||= 0
      end
      recommended_pages[page3] += 1
    end
    
    # filter down by category and retrieve top 5
    recommended_array = recommended_pages.sort{|a,b| a[1] <=> b[1]}.reverse
    pages = []
    recommended_array.each do |pair|
      page = pair[0]
      pages.push(pair[0])
    end
    
    if (pages.count >= 5)
      pages[0..4]
    else
      pages
    end
  end

  def category_tags
    @category_tags ||= self.categories.map(&:name) 
  end
  
  # Assign categories to the page using the category name 
  # Accepts either an array of strings or a single string with comma separated names (used by the form)
  def category_tags=(tags)
    tags = tags.split(',') if tags.is_a?(String)
    @category_tags = tags.map(&:downcase).map(&:strip).reject(&:empty?)
  end
  
  # Generate the url for the profile pic on facebook
  # Takes a type ('square','small',large') to scale the image 
  def profile_picture_url(type="square")
    "http://graph.facebook.com/#{self.page_id}/picture?type=#{type}"
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

