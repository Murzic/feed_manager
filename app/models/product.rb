class Product < ActiveRecord::Base
  belongs_to :feed

  def images_array
    image_urls.split(/https?:\/\//).reject(&:empty?).map{|url| "//" + url}
  end
end
