FactoryBot.define do
  factory :borrow do
    start_date Time.now + 1.days
    end_date Time.now + 7.days
    approve false
    user_id 1
  end
end
