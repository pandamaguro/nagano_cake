class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
	validates :customer_id, :item_id, :count, presence: true
  validates :count, numericality: { only_integer: true }
end
