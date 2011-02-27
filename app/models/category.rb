class Category < ActiveRecord::Base
  has_many :categories_pages
  has_many :pages, :through=>:categories_pages
end
