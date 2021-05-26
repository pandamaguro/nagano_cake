class Order < ApplicationRecord
  belongs_to :customer
	has_many :order_details, dependent: :destroy

	validates :customer_id, :address, :name, :shipping_cost,
			  		:total_payment, :payment_method,
			  		presence: true
	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
	validates :shipping_cost, :total_payment, numericality: { only_integer: true }

	enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
	enum status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

end
