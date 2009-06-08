require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserTwitterTimelines do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :screen_name => "value for screen_name",
      :band_with_twitter_user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    UserTwitterTimelines.create!(@valid_attributes)
  end
end
