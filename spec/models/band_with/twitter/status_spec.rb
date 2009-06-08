require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe BandWith::Twitter::Status do
  before(:each) do
    @valid_attributes = {
      :created_at => Time.now,
      :status_id => 1,
      :text => "value for text",
      :source => "value for source",
      :truncated => false,
      :in_reply_to_status_id => 1,
      :in_reply_to_user_id => "value for in_reply_to_user_id",
      :in_reply_to_screen_name => "value for in_reply_to_screen_name",
      :user => "value for user"
    }
  end

  it "should create a new instance given valid attributes" do
    BandWith::Twitter::Status.create!(@valid_attributes)
  end
end
