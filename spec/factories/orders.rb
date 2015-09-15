FactoryGirl.define do
  factory :order do
    customer_name    "João Silva"
    merchant_address "Fake St"
    merchant_name    "Bob's Pizza"
    total 10
  end

end
