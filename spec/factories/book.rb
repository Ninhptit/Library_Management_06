FactoryBot.define do
  factory :book do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph}
    total_pages { Faker::Number.number(3) }
    quantity { Faker::Number.between(10, 20) }
    publisher 1
    image { File.open("#{Rails.root}/spec/pictures/book/image_example.jpg") }
  end
end
