class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_many :orders, through: :order_details

  attachment :image

  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  
  def self.search_for(content,method)
    return none if content.blank?
     if method == 'perfect'
       Item.where(name: content)
       
     elsif method == 'forward'
       Item.where('name LIKE ?', content + '%')
       
     elsif method == 'backword'
       Item.where('name LIKE ?', '%' + content)
     else
       Item.where('name LIKE ?', '%' + content + '%')
     end
  end
end
