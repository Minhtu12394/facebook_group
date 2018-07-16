FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password "123456"
    encrypted_password "123456"
  end
end
