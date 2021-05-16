module ApplicationHelper
  def full_name(customer)
    customer.last_name + customer.first_name
  end
  
  def kana_full_name(customer)
    customer.kana_last_name + customer.kana_first_name
  end
end
