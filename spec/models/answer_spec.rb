require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "is invalid without an response" do
      FactoryGirl.build(:answer, response: nil).should_not be_valid
    end
end

