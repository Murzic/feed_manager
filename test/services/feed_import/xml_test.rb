class FeedImport::XMLTest < ActiveSupport::TestCase
  setup do
    @files_path = File.join File.dirname(__FILE__), "../../files/" 
  end

  test "should create products" do
    feed_file = File.open(@files_path + "/test_feed.xml", 'r')

    assert_respond_to FeedImport::XML.new(feed_file).call, :num_inserts
  end
end
