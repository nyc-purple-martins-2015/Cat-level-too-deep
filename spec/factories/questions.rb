FactoryGirl.define do
  factory :question do
    sequence(:title) { Faker::Hacker.noun }
    sequence(:query) { Faker::Hacker.say_something_smart }
  end
end
