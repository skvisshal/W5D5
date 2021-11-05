# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

u1 = User.create!(username: "David")
u2 = User.create!(username: "John")

p1 = Poll.create!(title: "Hello", author: u1)

q1 = Question.create!(text: "How was your day?", poll: p1)

a1 = AnswerChoice.create!(text: "Really good", question: q1)
a2 = AnswerChoice.create!(text: "Good", question: q1)
a3 = AnswerChoice.create!(text: "Bad", question: q1)
a4 = AnswerChoice.create!(text: "Really Bad", question: q1)

r1 = Response.create!(respondent: u1, answer_choice: a1)
r2 = Response.create!(respondent: u2, answer_choice: a4)
r3 = Response.create!(respondent: u2, answer_choice: a3)
end