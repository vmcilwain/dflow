FactoryBot.define do
  factory :post do
    subject { Faker::Lorem.words(number: 5) }
    content { Faker::Lorem.paragraphs(number: 5).join("<br />") }
    association :creator, factory: :user
  end
end
