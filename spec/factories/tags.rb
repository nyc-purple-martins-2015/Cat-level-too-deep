FactoryGirl.define do
  factory :tag do
    sequence(:category) { Faker::Hacker.adjective }
  end
end
