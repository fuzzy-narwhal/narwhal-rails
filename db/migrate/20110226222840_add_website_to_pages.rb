class AddWebsiteToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :website, :string
  end

  def self.down
  end
end
