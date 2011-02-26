class AddPropertiesToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :name, :string
    add_column :pages, :picture, :string
    add_column :pages, :link, :string
    add_column :pages, :category, :string
    add_column :pages, :city, :string
    add_column :pages, :state, :string
    add_column :pages, :country, :string
    add_column :pages, :zip, :string
    add_column :pages, :street_parking, :boolean
    add_column :pages, :lot_parking, :boolean
    add_column :pages, :public_transit, :string
    add_column :pages, :likes, :integer
  end

  def self.down
  end
end
