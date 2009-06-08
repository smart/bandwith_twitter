class CreateUserTwitterSearchTerms < ActiveRecord::Migration
  def self.up
    create_table :user_twitter_search_terms do |t|
      t.integer :user_id, :null => false
      t.string :search_term, :null => false
      t.integer :strength, :null => false, :default => 0

      t.timestamps
    end
    
    add_index :user_twitter_search_terms, :user_id
  end

  def self.down
    drop_table :user_twitter_search_terms
  end
end
