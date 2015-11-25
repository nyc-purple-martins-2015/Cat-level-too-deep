require 'spec_helper'

RSpec.describe Question, type: :model do
  it "is invalid without a title" do
      FactoryGirl.build(:question, title: nil).should_not be_valid
    end
  it "is invalid without a query" do
      FactoryGirl.build(:question, query: nil).should_not be_valid
    end
  it "is invalid without an author" do
      FactoryGirl.build(:question, author: nil).should_not be_valid
    end
end
