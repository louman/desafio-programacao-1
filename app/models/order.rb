class Order < ActiveRecord::Base

  has_many :order_items

  validates :total, :customer_name, :merchant_address, :merchant_name, presence: true

end
