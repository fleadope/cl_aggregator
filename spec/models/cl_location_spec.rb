require 'spec_helper'

describe ClLocation do
  before(:each) do
      @loc = Fabricate(:cl_location)
  end

  it "should return a proper domain" do
      domain = "#{@loc.name}.craigslist.org"
      @loc.domain.should == domain

  end
end
