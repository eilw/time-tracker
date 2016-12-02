FactoryGirl.define do
  sequence(:name) { |n| "Test Client #{n}" }

  factory :client do
    name
  end
end
