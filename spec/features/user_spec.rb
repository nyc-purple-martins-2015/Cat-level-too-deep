require 'spec_helper'

RSpec.feature "User browsing the website" do
  context "on homepage" do
    let(:question) { FactoryGirl.build(:question) }
    it "see a list of question titles" do
      question.save
      visit questions_path
      expect(page).to have_css(".question_summary_display")
    end
  end
end