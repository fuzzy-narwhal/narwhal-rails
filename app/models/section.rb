class Section < ActiveRecord::Base
  has_many :pages
  
  validates :name, :presence=>true, :uniqueness=>true
  
  def self.find_by_name_or_id(arg)
    find_by_id(arg) || find_by_name(arg.downcase)
  end
  
  def name=(n)
    super(n.downcase)
  end
  
end
