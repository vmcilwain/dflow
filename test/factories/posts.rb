FactoryBot.define do
  factory :post do
    title { Faker::Lorem.words(number: 5).join("\s") }
    content { Faker::Lorem.paragraphs(number: 5).join("<br />") }
    association :creator, factory: :user
  end
end
