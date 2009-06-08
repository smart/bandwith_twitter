# == Schema Information
# Schema version: 20090608160736
#
# Table name: user_twitter_timelines
#
#  id                        :integer         not null, primary key
#  user_id                   :integer         not null
#  screen_name               :string(255)     not null
#  band_with_twitter_user_id :integer
#  created_at                :datetime
#  updated_at                :datetime
#

class UserTwitterTimeline < ActiveRecord::Base
  belongs_to :user
  belongs_to :twitter_user,
    :foreign_key => 'band_with_twitter_user_id',
    :class_name => 'BandWith::Twitter::User'
  has_many :tweets,
    :through => :twitter_user,
    :class_name => 'BandWith::Twitter::Status'
end
