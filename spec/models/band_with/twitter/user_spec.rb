require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe BandWith::Twitter::User do
  before(:each) do
    @valid_attributes = {
      :twitter_id => 1,
      :name => "value for name",
      :screen_name => "value for screen_name",
      :location => "value for location",
      :description => "value for description",
      :profile_image_url => "value for profile_image_url",
      :url => "value for url",
      :protected => false,
      :followers_count => 1,
      :friends_count => 1,
      :created_at => Time.now,
      :utc_offset => 1,
      :time_zone => "value for time_zone",
      :statuses_count => 1
    }
  end

  it "should create a new instance given valid attributes" do
    BandWith::Twitter::User.create!(@valid_attributes)
  end
end
