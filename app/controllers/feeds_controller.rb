class FeedsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feeds = Feed.order(:id)
  end

  def show
    @feed = Feed.find(params[:id])
    @products = @feed.products.paginate(page: params[:page], per_page: 10)
  end
end
