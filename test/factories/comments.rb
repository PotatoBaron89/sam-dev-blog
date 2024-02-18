FactoryBot.define do
  factory :comment do
    commentable_type { "MyString" }
    commentable_id { 1 }
    commenter_id { 1 }
    body { "MyText" }
    archived { false }
  end
end
