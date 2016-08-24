require 'rexml/document'

class ImportFeedService
  def initialize uploaded_file
    @uploaded_file = uploaded_file
  end

  def call
    feed = Feed.create
    doc = REXML::Document.new(@uploaded_file.tempfile)
    root = doc.root
    Product.transaction do 
      root.elements.each("item") do |el| 
        feed.products.create(
          title: el.elements["title"].text,
          aff_code: el.elements["aff_code"].text,
          price: el.elements["price"].text,
          campaign_name: el.elements["campaign_name"].text,
          image_urls: el.elements["image_urls"].text,
          description: el.elements["description"].text
          )
      end
    end
  end

  private

  attr_reader :uploaded_file
end
