class CreateUserTwitterTimelines < ActiveRecord::Migration
  def self.up
    create_table :user_twitter_timelines do |t|
      t.integer :user_id, :null => false
      t.string :screen_name, :null => false
      t.integer :band_with_twitter_user_id

      t.timestamps
    end
    
    add_index :user_twitter_timelines, :user_id
    add_index :user_twitter_timelines, :screen_name
    add_index :user_twitter_timelines, :band_with_twitter_user_id
  end

  def self.down
    drop_table :user_twitter_timelines
  end
end
