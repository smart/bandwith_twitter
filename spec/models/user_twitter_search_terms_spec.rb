require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserTwitterSearchTerms do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :search_term => "value for search_term",
      :strength => 1
    }
  end

  it "should create a new instance given valid attributes" do
    UserTwitterSearchTerms.create!(@valid_attributes)
  end
end
