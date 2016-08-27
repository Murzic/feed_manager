class FeedImport::CSVTest < ActiveSupport::TestCase
  setup do
    @files_path = File.join File.dirname(__FILE__), "../../files/" 
  end

  test "should create products" do
    feed_file = File.open(@files_path + "/test_feed.csv", 'r')

    assert_respond_to FeedImport::CSV.new(feed_file).call, :num_inserts
  end
end
