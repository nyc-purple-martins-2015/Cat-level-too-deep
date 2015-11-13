# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.create!(username: "g", password: "g", email: "g")
q1 = Question.create!(author: u, title: "t", query: "q", best_answer_id: 1)
q2 = u.questions.create!(title: "tttt", query: "wwwwq", best_answer_id: 1)
q2.votes.create!(user: u)
a= Answer.create!(user: u, question: q1, response: "an answer response")
Vote.create(votable: q1, user:u, up_vote: true)

Tag.create!(category: "Clawjure")
Tag.create!(category: "Purrl")
QuestionTag.create!( tag_id: 1, question_id: 2)
QuestionTag.create!( tag_id: 2, question_id: 1)