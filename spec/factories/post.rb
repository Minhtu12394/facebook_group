FactoryGirl.define do
  factory :post do
    content {Faker::Lorem.sentence}
    group_id 1
    user_id 1
  end
end
