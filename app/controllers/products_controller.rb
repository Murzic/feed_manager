class ProductsController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

  def new
    @feed = Feed.find(params[:feed_id])
    @product = @feed.products.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @feed = Feed.find(params[:feed_id])  
    @product = @feed.products.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else 
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      redirect_to feed_path(@product.feed_id)
    else
      redirect_to @product
    end
  end
  private

  def product_params
    params.require(:product).permit(:title, :aff_code, :price, :campaign_name, :image_urls, :description)
  end
end
