FactoryBot.define do
  factory :rate do
    user_id 1
    book_id 1
    point { Faker::Number.number(3) }
  end
end
