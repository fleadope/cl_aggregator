require 'search_parser'
require 'shared_context/setup_parser'

describe SearchParser do 
    include SetupParser 

    let!(:setup)  { setup_parser }
    let(:parser)  { setup.first }
    let(:results) { setup.last }

    it "should find results" do
        expect(results).to be_an(Array)
    end

    describe "#has_more?" do
        subject { parser }
        it { should respond_to(:has_more?) }

        it "should be false if there are no more" do
            search = Fabricate(:search, terms: "terms")
            parser = setup_parser(search).first
            expect(parser.has_more?).not_to be(true)
        end 
    end

    describe "#next" do
        subject { parser }
        it { should respond_to(:next) }
        it "should be a url" do
        expect(subject.next).to be_a(String)
    end
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
                expect(subject.pid).to eq "4160309386"
            end

            it "#href" do
                expect(subject.href).to eq "/bab/#{subject.pid}.html"
            end

            it "#date" do
                result = Date.parse("29 Oct 2013")
                expect(subject.date).to eq result
            end

            it "#text" do
                expect(subject.text).to eq "2 car seats, feeding chair, diaper champ, more kids items"
            end
        end
    end
end
