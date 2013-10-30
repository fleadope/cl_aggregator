require 'spec_helper'

describe Category do
  it "should have a default" do
    expect(Category.default).to eq('sss')
  end
end
