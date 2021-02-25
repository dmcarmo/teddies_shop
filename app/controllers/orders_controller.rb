class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    cart = Cart.find(params[:cart_id])
    order  = Order.create!(state: 'pending', user: current_user)
    order.line_items = cart.line_items
    line_items = []
    order.line_items.each do |item|
      line_items.push({
        name: item.product.sku,
        images: [item.product.photo_url],
        amount: item.product.price_cents,
        currency: 'eur',
        quantity: item.quantity
        })
    end
    
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: line_items,
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)

  end

  def line_items

  end
  
end
