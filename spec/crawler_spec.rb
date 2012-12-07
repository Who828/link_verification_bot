require 'crawler'
require 'vcr_setup'

describe Crawler do
  it "gives you a list of URL on a page" do
    VCR.use_cassette('blog-42') do
      crawler = Crawler.new('http://blog-42-staging.herokuapp.com/')
      result = crawler.parse
      result.first.should =~ /\/auth\/google/
      result.length.should == 1
    end
  end

  it "gives you an absolute url for the page" do
    VCR.use_cassette('blog-42') do
      crawler = Crawler.new('http://blog-42-staging.herokuapp.com/')
      result = crawler.parse
      result.should include "http://blog-42-staging.herokuapp.com/auth/google"
    end
  end
end
