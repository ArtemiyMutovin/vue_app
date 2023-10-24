FactoryBot.define do
  sequence :name do |n|
    "name#{n}"
  end

  sequence :org_type do |n|
    "org_type#{n}"
  end

  sequence :ogrn do |n|
    "ogrn#{n}"
  end

  factory :organization do
    name
    org_type
    inn {'1'}
    ogrn
  end
end
