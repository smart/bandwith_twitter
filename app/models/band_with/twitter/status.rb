# == Schema Information
# Schema version: 20090608160736
#
# Table name: band_with_twitter_statuses
#
#  id                        :integer         not null, primary key
#  band_with_twitter_user_id :integer         not null
#  screen_name               :string(255)     not null
#  created_at                :datetime
#  status_id                 :integer         not null
#  text                      :string(255)     not null
#  source                    :string(255)
#  truncated                 :boolean         not null
#  in_reply_to_status_id     :integer
#  in_reply_to_user_id       :string(255)
#  in_reply_to_screen_name   :string(255)
#  user                      :text
#  updated_at                :datetime
#

class BandWith::Twitter::Status < ActiveRecord::Base
  set_table_name 'band_with_twitter_statuses'
  
  belongs_to :twitter_user,
    :foreign_key => 'band_with_twitter_user_id',
    :class_name => 'BandWith::Twitter::User'
  
  validates_uniqueness_of :status_id
  
  serialize :user
end
