class CreateBandWithTwitterStatuses < ActiveRecord::Migration
  def self.up
    create_table :band_with_twitter_statuses do |t|
      t.integer :band_with_twitter_user_id, :null => false
      t.string :screen_name, :null => false
      t.datetime :created_at, :null => false
      t.integer :status_id, :null => false
      t.string :text, :null => false
      t.string :source
      t.boolean :truncated, :null => false, :default => false
      t.integer :in_reply_to_status_id
      t.string :in_reply_to_user_id
      t.string :in_reply_to_screen_name
      t.text :user

      t.timestamps
    end
    
    add_index :band_with_twitter_statuses, :band_with_twitter_user_id
    add_index :band_with_twitter_statuses, :screen_name
    add_index :band_with_twitter_statuses, :created_at
    add_index :band_with_twitter_statuses, :status_id, :unique => true
  end

  def self.down
    drop_table :band_with_twitter_statuses
  end
end
