class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:destroy, :add_quantity, :reduce_quantity]
  before_action :set_product, only: [:create]

  def create
    chosen_product = @product
    current_cart = @current_cart

    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @line_item = current_cart.line_items.find_by(product_id: chosen_product)
      # Iterate the line_item's quantity by one
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.product = chosen_product
    end

    # Save and redirect to cart show path
    @line_item.save!
    redirect_to cart_path(current_cart)
  end

  def destroy
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @line_item.quantity += 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id, :cart_id)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
