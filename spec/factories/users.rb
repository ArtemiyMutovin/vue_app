FactoryBot.define do
  sequence :fullname do |n|
    "fullname#{n}"
  end

  sequence :email do |n|
    "email#{n}@mail.com"
  end

  factory :user do
    email
    fullname
    phone {'12345678'}
    password { '123456' }
  end
end
