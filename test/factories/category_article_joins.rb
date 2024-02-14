FactoryBot.define do
  factory :category_article_join do
    category { nil }
    article { nil }
    archived { false }
  end
end
