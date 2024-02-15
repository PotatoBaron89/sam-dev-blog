FactoryBot.define do
  factory :role do
    name { "MyString" }
    archived { false }
    user { nil }
  end
end
