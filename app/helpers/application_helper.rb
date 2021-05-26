module ApplicationHelper
  def full_name(customer)
    customer.last_name + customer.first_name
  end

  def kana_full_name(customer)
    customer.kana_last_name + customer.kana_first_name
  end

  def full_address(key)
    "#{key.postal_code}#{key.address}"
  end

  def current_cart
    @cart_items = current_customer.cart_items
  end

  # 小計の計算
  def sub_price(sub)
    sub.item.tax_in_price * sub.count
  end

  # 合計金額の計算
  def total_price(totals)
    price = 0
    totals.each do |total|
      price  +=  sub_price(total)
    end
    return price
  end


  def billing(order)
    total_price(current_cart) + order.shipping_cost
  end

# タブへの表示
	def full_title(title = "")
	  base = "NaganoCake"
	  if admin_signed_in?
	    base + " | " + "管理者用 #{title}"
	  else
	    base + " | " + "#{title}"
	  end
	end

end
