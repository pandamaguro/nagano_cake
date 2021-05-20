class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def tax_in_price
    (price * 1.1).floor
  end
end
