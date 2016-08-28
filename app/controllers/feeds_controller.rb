class FeedsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feeds = Feed.order(id: :desc).paginate(page: params[:page], per_page: 5)
  end

  def show
    @feed = Feed.find(params[:id])
    @products = @feed.products.where("lower(title) LIKE lower(?)", "%#{params[:q]}%").order_by(params[:sort], params[:order]).paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    redirect_to feeds_path
  end
end
