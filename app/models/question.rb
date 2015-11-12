class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :answers
  has_many :votes, as: :votable
  has_many :question_tags
  has_many :tags, through: :question_tags

  validates :query, presence: true
  validates :title, presence: true
  validates :author, presence: true
end
