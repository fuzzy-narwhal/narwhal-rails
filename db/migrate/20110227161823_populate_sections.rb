class PopulateSections < ActiveRecord::Migration
  def self.up
    Section.delete_all
    ["Art","Theater","Music","Movies","History","Educational","Food"].each {|name| Section.create!(:name=>name)}
  end

  def self.down
  end
end
