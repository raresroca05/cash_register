require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:cart_items) }

  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

  it "is valid with valid attributes" do
    product = build(:product)
    expect(product).to be_valid
  end

  it "is not valid without a code" do
    product = build(:product, code: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a name" do
    product = build(:product, name: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a price" do
    product = build(:product, price: nil)
    expect(product).to_not be_valid
  end
end
