class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @product.reviews.sort {|x,y| y.created_at <=> x.created_at }
  end

end
