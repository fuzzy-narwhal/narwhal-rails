class AddPageIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :page_id, :integer
  end

  def self.down
    remove_column :posts, :page_id
  end
end
