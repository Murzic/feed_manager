class Product < ActiveRecord::Base
  belongs_to :feed

  # Mappings from known values to SQL
  ORDER_MAPPINGS = {
    'price_asc'  => 'CAST(price AS float) ASC',
    'price_desc' => 'CAST(price AS float) DESC',
    'title_'   => 'title',
  }

  scope :order_by, -> (sort, order) { order(ORDER_MAPPINGS[sort + "_" + order]) }

  def images_array
    if image_urls
      image_urls.split(/https?:\/\//).reject(&:empty?).map{|url| "//" + url}
    else
      []
    end
  end
end
