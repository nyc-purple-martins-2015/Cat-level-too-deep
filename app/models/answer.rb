class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :votable

  validates :response, presence: true

end
