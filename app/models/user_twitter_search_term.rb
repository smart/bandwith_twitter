# == Schema Information
# Schema version: 20090608160736
#
# Table name: user_twitter_search_terms
#
#  id          :integer         not null, primary key
#  user_id     :integer         not null
#  search_term :string(255)     not null
#  strength    :integer         default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#

class UserTwitterSearchTerm < ActiveRecord::Base
  belongs_to :user
end
