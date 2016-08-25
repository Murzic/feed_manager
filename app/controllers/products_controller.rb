class ProductsController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

  def new
    @feed = Feed.find(params[:feed_id])
    @product = @feed.products.new
  end
end
