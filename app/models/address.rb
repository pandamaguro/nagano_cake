class Address < ApplicationRecord
  belongs_to :customer
  	validates :customer_id, :name, :address, presence: true
  	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
end
