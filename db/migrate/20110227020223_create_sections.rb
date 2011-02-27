class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name
      t.timestamps
    end
    add_column :pages, :section_id, :integer
  end

  def self.down
    drop_table :sections
    remove_column :pages, :section_id
  end
end
