FactoryBot.define do
  factory :user_role do
    user { nil }
    role { nil }
    archived { false }
  end
end
