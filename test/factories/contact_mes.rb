FactoryBot.define do
  factory :contact_me do
    name { Faker::Name.name }
    sequence(:email) { |n| "email#{n}@example.com" }
    message { Faker::Lorem.paragraph }
  end
end
