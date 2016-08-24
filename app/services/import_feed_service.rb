class ImportFeedService
  def initialize uploaded_file
    @uploaded_file = uploaded_file
  end

  def call
    feed = Feed.new
  end

  private

  attr_reader :uploaded_file
end
