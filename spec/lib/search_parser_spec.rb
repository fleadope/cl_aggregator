require 'search_parser'

shared_context "setup parser" do
    let!(:data_file) { File.expand_path("../../test.html", __FILE__)}
    let!(:txt) { File.read(data_file)}
    let!(:parser) { described_class.new(txt) }
    let!(:results) { parser.results }
    let(:shared_let) { { arbitrary: 'object' } }
end

describe SearchParser do 
    include_context "setup parser"

    it "should have a parser" do
        expect(parser).to be_true

    end

    it "should work" do
        expect(shared_let[:arbitrary]).to eq("object")
    end

    it "should find results" do
        expect(results).to be_an(Array)
    end

    describe "#results" do
        include_context "setup parser"
        subject { should be_an(Array) }

        it "should be the right size" do
            expect(results.size).to eq(79)
        end

        context "each" do
            include_context "setup parser"
            subject { results.first }
            it { should be_a(SearchParser::Result) }
            it "#pid" do
                expect(subject.pid).to eq "4064889447"
            end

            it "#href" do
                expect(subject.href).to eq "/rvd/#{subject.pid}.html"
            end

            it "#date" do
                result = Date.parse("2013-10-06")
                expect(subject.date).to eq result
            end

            it "#text" do
                expect(subject.text).to eq "2001 Beaver Patriot Thunder"
            end
        end
    end
end
