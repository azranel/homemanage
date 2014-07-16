# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  salt = BCrypt::Engine.generate_salt
  factory :user do
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    email Faker::Internet.email
    salt salt
    password BCrypt::Engine.hash_secret("123456", salt)
  end

  factory :userjk do
    firstname "Jan"
    lastname "Kowalski"
    email "jkowalski@gmail.com"
    salt BCrypt::Engine.generate_salt
    password BCrypt::Engine.hash_secret("123456", salt)
  end
end
