class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :fb_id
      t.string :from
      t.string :message
      t.timestamp :updated_time
      t.integer :comments_count
      t.integer :likes_count

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
