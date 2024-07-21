class PricingRules
  STRAWBERRY_DISCOUNT_PRICE = 4.50

  def initialize(cart_items)
    @cart_items = cart_items
  end

  def total
    total_price = 0.to_f.round(2)

    @cart_items.each do |item|
      case item.product.code
      when 'GR1'
        total_price += green_tea_price(item)
      when 'SR1'
        total_price += strawberries_price(item)
      when 'CF1'
        total_price += coffee_price(item)
      end
    end

    total_price.to_f.round(2)
  end

  private

  def green_tea_price(item)
    (item.quantity / 2 + item.quantity % 2) * item.product.price
  end

  def strawberries_price(item)
    if item.quantity >= 3
      item.quantity * STRAWBERRY_DISCOUNT_PRICE
    else
      item.quantity * item.product.price
    end
  end

  def coffee_price(item)
    if item.quantity >= 3
      item.quantity * (item.product.price * 2/3)
    else
      item.quantity * item.product.price
    end
  end
end
