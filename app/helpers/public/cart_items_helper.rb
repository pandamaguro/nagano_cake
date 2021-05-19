module Public::CartItemsHelper
  def tax_in_price(cart_item)
    (cart_item.item.price * 1.1).to_i
  end

  def subtotal(cart_item)
    tax_in_price(cart_item) * cart_item.count
  end

  def total_price(cart_items)
    total_price = 0
    cart_items.each do |cart_item|
      total_price += subtotal(cart_item)
    end
    return total_price
  end
end
