require 'nokogiri'
require 'open-uri'

class Crawler
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def parse
    doc = Nokogiri::HTML(open(url))
    doc.css('a').map { |link| absolute_url(link['href']) }
  end

  private

  def absolute_url(link)
    URI.join(url, link).to_s
  end
end
