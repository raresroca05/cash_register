class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_product(product_code)
    product = Product.find_by(code: product_code)
    cart_item = cart_items.find_or_initialize_by(product: product)
    cart_item.quantity += 1
    cart_item.save!
  end

  def total_price
    PricingRules.new(cart_items).total
  end
end
