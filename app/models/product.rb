class Product < ActiveRecord::Base
  belongs_to :feed

  def images_array
    if image_urls
      image_urls.split(/https?:\/\//).reject(&:empty?).map{|url| "//" + url}
    else
      []
    end
  end
end
