class OrderItem < ActiveRecord::Base

  belongs_to :order

  validates :unit_price, :description, presence: true
  validates :quantity, presence: true, numericality: {  only_integer: true, greater_than: 0 }

end
