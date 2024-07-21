require 'rails_helper'

RSpec.describe PricingRules, type: :service do
  let!(:green_tea) { create(:product, code: 'GR1', name: 'Green Tea', price: 3.11) }
  let!(:strawberries) { create(:product, code: 'SR1', name: 'Strawberries', price: 5.00) }
  let!(:coffee) { create(:product, code: 'CF1', name: 'Coffee', price: 11.23) }

  it 'calculates the correct total for GR1, GR1' do
    cart = create(:cart)
    cart.add_product('GR1')
    cart.add_product('GR1')
    expect(cart.total_price).to eq 3.11
  end

  it 'calculates the correct total for SR1, SR1, GR1, SR1' do
    cart = create(:cart)
    cart.add_product('SR1')
    cart.add_product('SR1')
    cart.add_product('GR1')
    cart.add_product('SR1')
    expect(cart.total_price).to eq 16.61
  end

  it 'calculates the correct total for GR1, CF1, SR1, CF1, CF1' do
    cart = create(:cart)
    cart.add_product('GR1')
    cart.add_product('CF1')
    cart.add_product('SR1')
    cart.add_product('CF1')
    cart.add_product('CF1')
    expect(cart.total_price).to eq 30.57
  end
end
