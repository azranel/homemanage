# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  salt = BCrypt::Engine.generate_salt
  factory :user do |u|
    u.firstname { Faker::Name.first_name}
    u.lastname { Faker::Name.last_name }
    u.email { Faker::Internet.email }
    u.salt {salt}
    u.password { BCrypt::Engine.hash_secret("123456", salt) }
  end

  factory :userjk do
    firstname "Jan"
    lastname "Kowalski"
    email "jkowalski@gmail.com"
    salt BCrypt::Engine.generate_salt
    password BCrypt::Engine.hash_secret("123456", salt)
  end
end
