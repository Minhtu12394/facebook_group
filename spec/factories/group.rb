FactoryBot.define do
  factory :group do
    name{Faker::Name.name}
    creator_id 1
  end
end
