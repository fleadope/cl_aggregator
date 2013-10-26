require 'search_parser'
require 'shared_context/setup_parser'

describe SearchParser do 
    include_context "setup parser"

    it "should have a parser" do
        expect(parser).to be_true
    end

    it "should find results" do
        expect(results).to be_an(Array)
    end

    describe "#results" do
        subject { should be_an(Array) }

        it "should be the right size" do
            expect(results.size).to eq(100)
        end

        context "each" do
            subject { results.first }

            it { should be_a(SearchParser::Result) }

            it "#pid" do
                expect(subject.pid).to eq "4098602179"
            end

            it "#href" do
                expect(subject.href).to eq "/sys/#{subject.pid}.html"
            end

            it "#date" do
                result = Date.parse("26 Oct 2013")
                expect(subject.date).to eq result
            end

            it "#text" do
                expect(subject.text).to eq "HP Deskjet 6988 Wireless / Network"
            end
        end
    end
end
