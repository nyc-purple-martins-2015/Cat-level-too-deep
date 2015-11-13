FactoryGirl.define do
  factory :answer do
    sequence(:response) { Faker::Lorem.paragraph }
  end
end
