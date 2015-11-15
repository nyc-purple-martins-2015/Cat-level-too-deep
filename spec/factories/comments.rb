FactoryGirl.define do
  factory :answer_comment, class: "Comment" do
    # sequence(:user) { FactoryGirl.create(:user)}
    association :user, factory: :user
    sequence(:content) { Faker::Hacker.say_something_smart }
    sequence(:commentable_id) { FactoryGirl.create(:answer, user: FactoryGirl.create(:user), question: FactoryGirl.create(:question)).id }
    sequence(:commentable_type) { "Question" }

    # association :commentable, factory: :answer
  end

  factory :question_comment, class: "Comment" do
    sequence(:user) { User.first(order: "RANDOM()") }
    sequence(:content) { Faker::Hacker.say_something_smart }
    association :commentable, factory: :question
  end
end
