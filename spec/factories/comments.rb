FactoryGirl.define do
  factory :answer_comment, class: "Comment" do
    association :user, factory: :user
    sequence(:content) { Faker::Hacker.say_something_smart }
    sequence(:commentable_id) { FactoryGirl.create(:answer, user: FactoryGirl.create(:user), question: FactoryGirl.create(:question)).id }
    sequence(:commentable_type) { "Answer" }
  end

  factory :question_comment, class: "Comment" do
    association :user, factory: :user
    sequence(:content) { Faker::Hacker.say_something_smart }
    sequence(:commentable_id) { FactoryGirl.create(:question, author: FactoryGirl.create(:user)).id }
    sequence(:commentable_type) { "Question" }
  end
end
