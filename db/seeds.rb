# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

user1 = User.create(email: Faker::Internet.email, password: 'password')
10.times do |i|
  User.create(email: Faker::Internet.email, password: 'password')
  10.times do |j|
    post = Post.create(title: Faker::Lorem.sentence, text: Faker::Lorem.paragraph, user_id: user1.id + 1, score: rand(-10..10))
    10.times do |k|
    	Comment.create(text: Faker::Lorem.paragraph(2), post_id: post.id, user_id: rand((user1.id)..(user1.id + 9)), score: rand(-10..10))
    end
  end
end
