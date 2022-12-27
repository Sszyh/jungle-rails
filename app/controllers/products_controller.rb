class ProductsController < ApplicationController

  # before_action :authorize  //no need for right now
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
