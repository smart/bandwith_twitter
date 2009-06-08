class CreateBandWithTwitterUsers < ActiveRecord::Migration
  def self.up
    create_table :band_with_twitter_users do |t|
      t.integer :twitter_id
      t.string :name, :null => false
      t.string :screen_name, :null => false
      t.string :location
      t.string :description
      t.string :profile_image_url
      t.string :url
      t.boolean :protected, :null => false, :default => false
      t.integer :followers_count, :null => false, :default => 0
      t.integer :friends_count, :null => false, :default => 0
      t.integer :statuses_count, :null => false, :default => 0
      t.datetime :created_at, :null => false
      t.integer :utc_offset
      t.string :time_zone

      t.timestamps
    end
    
    add_index :band_with_twitter_users, :screen_name, :unique => true
    add_index :band_with_twitter_users, :twitter_id
    add_index :band_with_twitter_users, :followers_count
    add_index :band_with_twitter_users, :friends_count
    add_index :band_with_twitter_users, :statuses_count
    add_index :band_with_twitter_users, :created_at
  end

  def self.down
    drop_table :band_with_twitter_users
  end
end
