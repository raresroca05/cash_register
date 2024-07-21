require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let!(:product) { create(:product, code: 'GR1', name: 'Green Tea', price: 3.11) }
  let!(:cart) { create(:cart) }
  let!(:cart_item) { create(:cart_item, cart: cart, product: product, quantity: 2) }

  before do
    session[:cart_id] = cart.id
  end

  describe 'POST #add_product' do
    it 'adds a product to the cart' do
      post :add_product, params: { product_code: product.code }

      expect(response).to redirect_to(cart_path)

      cart_item_loaded = CartItem.find_by(product: product)
      expect(cart_item_loaded.quantity).to eq(3)
    end
  end

  describe 'DELETE #remove_product' do
    context 'when the product quantity is greater than 1' do
      it 'decreases the product quantity' do
        expect {
          delete :remove_product, params: { product_id: product.id }
        }.to change { cart_item.reload.quantity }.by(-1)
        expect(response).to redirect_to(cart_path)
      end
    end

    context 'when the product quantity is 1' do
      before do
        cart_item.update(quantity: 1)
      end

      it 'removes the product from the cart' do
        expect {
          delete :remove_product, params: { product_id: product.id }
        }.to change(CartItem, :count).by(-1)
        expect(response).to redirect_to(cart_path)
      end
    end
  end

  describe 'GET #show' do
    it 'shows the cart' do
      get :show
      expect(response).to be_successful
    end
  end
end
