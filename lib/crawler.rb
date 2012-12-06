require 'nokogiri'

class Crawler
  def parse(filename)
    Nokogiri::HTML(open(filename))
  end
end
