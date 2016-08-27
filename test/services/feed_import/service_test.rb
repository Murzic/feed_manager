require 'test_helper'
# require 'benchmark'

class FeedImport::ServiceTest < ActiveSupport::TestCase
  setup do
    @files_path = File.join File.dirname(__FILE__), "../../files/" 
  end

  test "should set the FeedImport::XML strategy class" do
    test_feed_file = File.open(@files_path + "/test_feed.xml", 'r')
    uploaded_file = XMLUploadedFileMock.new(test_feed_file)

    service_obj = FeedImport::Service.new
    assert_nothing_raised { service_obj.set_strategy(uploaded_file) }
    assert_equal "FeedImport::XML", service_obj.strategy_class_name
  end

  test "should set the FeedImport::CSV strategy class" do
    test_feed_file = File.open(@files_path + "/test_feed.xml", 'r')
    uploaded_file = CSVUploadedFileMock.new(test_feed_file)

    service_obj = FeedImport::Service.new
    assert_nothing_raised { service_obj.set_strategy(uploaded_file) }
    assert_equal "FeedImport::CSV", service_obj.strategy_class_name
  end

  test "should raise an error if an incorrect file was given" do
    test_feed_file = File.open(@files_path + "/test_feed.bad", 'r')
    uploaded_file = BadUploadedFileMock.new(test_feed_file)

    service_obj = FeedImport::Service.new
    assert_raises { service_obj.set_strategy(uploaded_file) }
  end

  test "should create products when given an xml" do
    skip
    test_feed_file = File.open(@files_path + "/test_feed.xml", 'r')
    uploaded_file = XMLUploadedFileMock.new(test_feed_file)

    service_obj = FeedImport::Service.new
    service_obj.set_strategy(uploaded_file)


    assert_respond_to service_obj.call, :num_inserts 
  end

  test "should create products when given an csv" do
    skip
    test_feed_file = File.open(@files_path + "/test_feed.csv", 'r')
    uploaded_file = CSVUploadedFileMock.new(test_feed_file)

    service_obj = FeedImport::Service.new
    service_obj.set_strategy(uploaded_file)


    assert_respond_to service_obj.call, :num_inserts 
  end
end


class XMLUploadedFileMock
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

class CSVUploadedFileMock
  def initialize csv_feed
    @csv_feed = csv_feed
  end

  def tempfile
    @csv_feed
  end

  def content_type
    "text/csv"
  end
end

class BadUploadedFileMock
  def initialize bad_file
    @bad_file = bad_file
  end

  def tempfile
    @bad_file
  end

  def content_type
    "file/bad"
  end
end
