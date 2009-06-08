class CreateGnipQueue < ActiveRecord::Migration
  def self.up
    create_table :gnip_queue do |t|
      t.string :publisher, :null => false, :default => 'unknown'
      t.string :state, :null => false, :default => 'new'
      t.text :document, :null => false
      
      t.timestamps
    end
    
    add_index :gnip_queue, :publisher
    add_index :gnip_queue, :state
  end

  def self.down
    drop_table :gnip_queue
  end
end
