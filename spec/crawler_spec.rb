require 'crawler'

describe Crawler do
  it "gives you a list of URL on a page" do
    crawler = Crawler.new
    result = crawler.parse('fixtures/test.html')
    result.content =~ /google.com/
  end
end
