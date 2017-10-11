FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end
  sequence :username do |n|
    "test#{n}"
  end
  factory :user do
    email { generate :email}
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "Catlyn"
    last_name "Stark"
    username { generate :username }
  end
end
