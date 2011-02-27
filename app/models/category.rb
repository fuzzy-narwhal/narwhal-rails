class Category < ActiveRecord::Base
  has_many :categories_pages
  has_many :pages, :through=>:categories_pages
  
  def self.find_by_name_or_id(arg)
    find_by_id(arg) || find_by_name(arg.downcase)
  end
  
end
