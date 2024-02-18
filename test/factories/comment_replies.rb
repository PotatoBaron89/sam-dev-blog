FactoryBot.define do
  factory :comment_reply do
    comment { nil }
    commenter { 1 }
    body { "MyText" }
    archived { false }
  end
end
