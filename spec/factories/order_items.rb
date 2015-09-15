FactoryGirl.define do
  factory :order_item do
    order
    unit_price 10
    quantity 1
    description 'R$10 off R$20 of food'
  end

end
