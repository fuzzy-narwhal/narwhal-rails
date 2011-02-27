class RenamePostsTypeToTyp < ActiveRecord::Migration
  def self.up
    remove_column :posts, :type
    add_column :posts, :typ, :string
  end

  def self.down
  end
end
