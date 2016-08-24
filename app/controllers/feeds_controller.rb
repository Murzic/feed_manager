class FeedsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feeds = Feed.order(:id)
  end

  def show
    @feed = Feed.find(params[:id])
    @products = @feed.products
  end
end
