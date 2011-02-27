class AddTypeToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :page_id, :integer
  end

  def self.down
  end
end
