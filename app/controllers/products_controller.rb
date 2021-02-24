class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.create(params)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit()
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
