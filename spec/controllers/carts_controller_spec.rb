require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let!(:product) { Product.create(code: 'GR1', name: 'Green Tea', price: 3.11) }

  describe 'POST #add_product' do
    it 'adds a product to the cart' do
      expect {
        post :add_product, params: { product_code: 'GR1' }
      }.to change(CartItem, :count).by(1)
      expect(response).to redirect_to(cart_path)
    end
  end

  describe 'GET #show' do
    it 'shows the cart' do
      get :show
      expect(response).to be_successful
    end
  end
end
