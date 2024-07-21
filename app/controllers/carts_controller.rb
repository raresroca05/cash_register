class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def add_product
    @cart.add_product(params[:product_code])
    redirect_to cart_path, notice: 'Product added to cart.'
  end

  def remove_product
    @cart.remove_product(params[:product_id])
    redirect_to cart_path, notice: 'Product removed from cart.'
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @cart.id
  end
end
