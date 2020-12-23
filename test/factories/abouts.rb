FactoryBot.define do
  factory :about do
    body {Faker::Lorem.paragraphs(number: 5)}
  end
end
