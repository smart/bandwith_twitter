class Gnip::Queue < ActiveRecord::Base
  set_table_name 'gnip_queue'
  include AASM
  
  serialize :document
    
  aasm_column :state
  aasm_initial_state :new
  
  aasm_state :new
  aasm_state :parsed
  aasm_state :processed
  
  aasm_event :parse do
    transitions :to => :parsed, :from => [:new]
  end
  
  aasm_event :process do
    transitions :to => :processed, :from => [:parsed]
  end
end
