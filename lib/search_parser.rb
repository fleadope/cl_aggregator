require 'nokogiri'
require 'chronic'

class SearchParser
  def initialize(txt, parser = nil)
    @parser = Nokogiri::HTML(txt)
  end

  def results
    @parser.css("p.row").inject([]) do |retval, result|
      retval << Result.new(result)
    end
  end

  def has_more?
    !next_link.empty? 
  end
  
  def next
    has_more? ? next_link.first.attributes["href"].value : nil
  end

  private 
  def next_link
    @parser.css("span.nplink.next").css("a")
  end

  class Result
    def initialize(doc)
      @doc = doc
    end

    def pid
      doc.attributes["data-pid"].value
    end

    def href
      pl.first.attributes["href"].value
    end

    def date
      Chronic.parse(doc.css("span.date").text).to_date
    end

    def text
      pl.text.strip
    end

    private
    def doc
      @doc
    end

    def pl
      @doc.css("span.pl").css('a[href]')
    end
  end
end
