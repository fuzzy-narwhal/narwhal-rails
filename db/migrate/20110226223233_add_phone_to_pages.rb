class AddPhoneToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :phone, :string
  end

  def self.down
  end
end
