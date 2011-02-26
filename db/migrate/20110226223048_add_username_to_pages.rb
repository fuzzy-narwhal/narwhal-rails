class AddUsernameToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :username, :string
  end

  def self.down
  end
end
