FactoryBot.define do
  factory :to_do do
    title { Faker::Verb.base }
    completed { false }
  end
end