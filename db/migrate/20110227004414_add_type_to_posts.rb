class AddTypeToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :type, :integer
  end

  def self.down
  end
end
