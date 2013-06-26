require 'faker'

FactoryGirl.define do
  factory :post do
    user_id 1
    text { Faker::Lorem.paragraph(5) }
  end
end
