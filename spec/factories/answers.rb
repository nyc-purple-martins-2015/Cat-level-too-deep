FactoryGirl.define do
  factory :answer do
    association :user, factory: :user
    association :question, factory: :question
    sequence(:response) { Faker::Lorem.paragraph }
  end
end
