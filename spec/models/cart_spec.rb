require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_many(:cart_items).dependent(:destroy) }

  let!(:product) { create(:product, code: 'GR1') }
  let!(:cart) { create(:cart) }

  it "adds a product to the cart" do
    cart.add_product(product.code)
    expect(cart.cart_items.first.product).to eq(product)
  end

  it "calculates the total price" do
    cart.add_product(product.code)
    expect(cart.total_price).to eq(3.11)
  end
end
