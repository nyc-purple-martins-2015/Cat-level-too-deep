FactoryGirl.define do
  factory :user do
    sequence(:username) { Faker::Internet.user_name }
    sequence(:password) {'password'}
    sequence(:email) { Faker::Internet.email }
  end
end
