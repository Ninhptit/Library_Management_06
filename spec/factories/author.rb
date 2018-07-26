FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    profile { Faker::Lorem.paragraph }
  end
end
