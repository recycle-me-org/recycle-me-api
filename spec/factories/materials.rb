FactoryBot.define do
  factory :material do
    id { Faker::Number.unique.between(from: 1, to: 100) }
    name { Faker::Music::Phish.song }
  end
end
