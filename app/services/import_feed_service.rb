class ImportFeedService
  def initialize uploaded_file
    @uploaded_file = uploaded_file
  end

  private

  attr_reader :uploaded_file
end
