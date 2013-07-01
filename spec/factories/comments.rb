require 'faker'

FactoryGirl.define do
  factory :comment do
    user
    post
    text { Faker::Lorem.paragraph }
  end
end
