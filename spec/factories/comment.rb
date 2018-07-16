FactoryGirl.define do
  factory :comment do
    content{Faker::Lorem.sentence 20}
    user_id 1
    post_id 1
  end
end
