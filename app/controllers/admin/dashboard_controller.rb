class Admin::DashboardController < ApplicationController
  def show
    @count_products = Product.count(:id)
    @count_categories = Category.count(:id)
  end
end
