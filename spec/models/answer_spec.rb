require 'rails_helper'

RSpec.describe Answer, type: :model do
    it "is invalid without a title" do
      FactoryGirl.build(:answer, user: nil).should_not be_valid
    end
  it "is invalid without a query" do
      FactoryGirl.build(:answer, question: nil).should_not be_valid
    end
  it "is invalid without an author" do
      FactoryGirl.build(:answer, response: nil).should_not be_valid
    end
end


end
