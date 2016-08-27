class FeedImport::CSV
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def call
    
  end

  private

  attr_reader :csv_file
end
