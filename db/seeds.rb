# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
calvin = User.create!(username: "calvin", password: "cat", email: "cat@example.com")
# q1 = Question.create!(author: calvin, title: "My first question", query: "What is the meaning of cat-life?", best_answer_id: 1)
q2 = calvin.questions.create!(title: "My second question", query: "Is there catnip in heaven?", best_answer_id: 1)
q2.votes.create!(user: calvin)
a= Answer.create!(user: calvin, question: q2, response: "Are you catting me? It's to hunt mice!")
Vote.create(votable: q2, user:calvin, up_vote: true)

Tag.create!(category: "Clawjure")
Tag.create!(category: "Purrl")
QuestionTag.create!( tag_id: 1, question_id: 2)
QuestionTag.create!( tag_id: 2, question_id: 1)
