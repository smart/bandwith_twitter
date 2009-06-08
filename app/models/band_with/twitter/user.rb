# == Schema Information
# Schema version: 20090608160736
#
# Table name: band_with_twitter_users
#
#  id                :integer         not null, primary key
#  twitter_id        :integer
#  name              :string(255)     not null
#  screen_name       :string(255)     not null
#  location          :string(255)
#  description       :string(255)
#  profile_image_url :string(255)
#  url               :string(255)
#  protected         :boolean         not null
#  followers_count   :integer         default(0), not null
#  friends_count     :integer         default(0), not null
#  statuses_count    :integer         default(0), not null
#  created_at        :datetime
#  utc_offset        :integer
#  time_zone         :string(255)
#  updated_at        :datetime
#

class BandWith::Twitter::User < ActiveRecord::Base
  set_table_name 'band_with_twitter_users'
  
  has_many :tweets,
    :foreign_key => 'band_with_twitter_user_id',
    :class_name => 'BandWith::Twitter:Status'
end
