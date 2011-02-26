class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :likes
      t.string :post_id
      t.string :from
      t.string :to
      t.string :message
      t.string :picture
      t.string :link_url
      t.string :link_name
      t.string :link_caption
      t.string :link_description
      t.string :movie_url
      t.string :icon
      t.string :attribution
      t.timestamp :created_time
      t.timestamp :updated_time
      t.integer :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
