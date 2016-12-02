FactoryGirl.define do
  sequence(:email) { |n| "test-#{n}@email.com" }

  factory :employee do
    email
    password '12121212'
  end
end
