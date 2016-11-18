FactoryGirl.define do
  factory :activity do
    date Date.today
    hours 1
    employee
    project
  end
end
