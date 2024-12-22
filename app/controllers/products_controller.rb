class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @variants = @product.variants
  end
end
