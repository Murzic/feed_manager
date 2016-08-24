require 'test_helper'
require 'benchmark'

class MockXMLUploadedFile
  def initialize xml_feed
    @xml_feed = xml_feed
  end

  def tempfile
    @xml_feed
  end

  def content_type
    "text/xml"
  end
end

class ImportFeedServiceTest < ActiveSupport::TestCase
  setup do
    @files_path = File.join File.dirname(__FILE__), "../files/" 
  end

  test "should accept a ActionDispatch::Http::UploadedFile object" do
    test_feed_xml = File.open(@files_path + "/test_feed.xml", 'r')
    uploaded_file = MockXMLUploadedFile.new(test_feed_xml)

    assert_nothing_raised do
      ImportFeedService.new(uploaded_file)
    end
  end

  test "should create products" do
    test_feed_xml = File.open(@files_path + "/test_feed.xml", 'r')
    uploaded_file = MockXMLUploadedFile.new(test_feed_xml)

    puts Benchmark.measure { ImportFeedService.new(uploaded_file).call }
    assert Product.count > 0 
  end
end
