require 'url_generator'

describe UrlGenerator do
  let!(:location) { Fabricate(:cl_location) }
  let(:search) { Fabricate(:search) }
  subject(:generator) { UrlGenerator.new(search) }

  it "should have a search" do
    expect(generator.search).to be_a Search
  end

  it "should generate an array" do
    expect(generator.generate).to be_an Array
  end
end
