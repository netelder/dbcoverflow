require 'faker'

FactoryGirl.define do
  factory :post do
    user
    text { Faker::Lorem.paragraph(5) }
  end
end
