FactoryGirl.define do
  factory :user do
    name 'Test User'
    sequence :email do |n|
      "test_#{n}@example.com"
    end 
    password '12345678'
    password_confirmation '12345678'
  end

end
