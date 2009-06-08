# == Schema Information
# Schema version: 20090608160736
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  login              :string(255)     not null
#  email              :string(255)     not null
#  organization_name  :string(255)     not null
#  crypted_password   :string(255)     not null
#  password_salt      :string(255)     not null
#  persistence_token  :string(255)     not null
#  login_count        :integer         default(0), not null
#  failed_login_count :integer         default(0), not null
#  last_request_at    :datetime
#  last_login_at      :datetime
#  current_login_at   :datetime
#  last_login_ip      :string(255)
#  current_login_ip   :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end
  
  has_many :twitter_timelines,
    :class_name => 'UserTwitterTimeline',
    :foreign_key => 'user_id'
  
  has_many :twitter_search_terms,
    :class_name => 'UserTwitterSearchTerm',
    :foreign_key => 'user_id'
end
