require 'spec_helper'
require 'search_processor_job'

describe Search do

  describe "failures" do
    subject { Search.new }

    it { should respond_to(:failures) }
    it { should respond_to(:failure_detail) }
    it "should set a default" do
      expect(subject.failures).to eq(0)
    end
  end

  describe "#failed?" do
  let(:failed) { Fabricate(:search, failures: 3) }
  let(:successful) { Fabricate(:search) }

    context "true" do
      subject { failed.failed? }
      it { should be(true) }
    end

    context "false" do
       subject { successful.failed? }
       it { should_not be(true) }
     end
  end

  describe "#mark_failed!" do
    subject { Fabricate(:search) }
    it "should succeed" do
      subject.mark_failed!("Because!")
      expect(subject.failures).to eq(1)
    end

    it "should record the reason" do
      subject.mark_failed!("Because!")
      expect(subject.failure_detail).to eq("Because!")
    end
  end

  describe "#perform" do
    subject(:search) { Fabricate(:search) }
    it "should happen" do
      #expect(UrlGenerator).to receive(:urls)
      #search.process
    end
  end
end
