FactoryGirl.define do
  factory :question do
    sequence(:author) { FactoryGirl.create(:user) }
    sequence(:title) { Faker::Hacker.noun }
    sequence(:query) { Faker::Hacker.say_something_smart }
  end
end
