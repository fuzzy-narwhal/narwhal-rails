class AddSomeIndexLove < ActiveRecord::Migration
  def self.up
    add_index :posts, :page_id
    add_index :events, :page_id
    add_index :sections, :name
    add_index :categories, :name
    add_index :pages, :section_id
    add_index :categories_pages, [:category_id, :page_id]
    add_index :categories_pages, [:page_id, :category_id]
  end

  def self.down
    remove_index :posts, :page_id
    remove_index :events, :page_id
    remove_index :section, :name
    remove_index :category, :name
    remove_index :pages, :section_id
    remove_index :categories_pages, [:category_id, :page_id]
    remove_index :categories_pages, [:page_id, :category_id]
  end
end
