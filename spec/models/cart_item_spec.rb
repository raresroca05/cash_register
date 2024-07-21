require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }

  it { should validate_presence_of(:cart) }
  it { should validate_presence_of(:product) }
  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity).only_integer.is_greater_than(0) }

  it "is valid with valid attributes" do
    cart_item = build(:cart_item)
    expect(cart_item).to be_valid
  end
end
