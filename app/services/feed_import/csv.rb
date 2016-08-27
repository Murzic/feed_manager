require "csv"

class FeedImport::CSV
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def call
    feed = Feed.create
    products = []

    CSV.foreach(csv_file, headers: true) do |el| 
      products.push feed.products.new(
        title: el["title"],
        aff_code: el["aff_code"],
        price: el["price"],
        campaign_name: el["campaign_name"],
        image_urls: el["image_urls"],
        category: el["category"],
        description: el["description"]
        )
    end
    Product.import products, validate: false
  end

  private

  attr_reader :csv_file
end
