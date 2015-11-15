require 'rails_helper'
require 'pry'

describe CommentsController  do

  let(:comment_on_answer) { FactoryGirl.build(:answer_comment) }

  context 'comment_params' do
    it 'returns the correct params hash when comment_params is called' do
      binding.pry
      expect(comment_params)
    end
  end

end
