class Article < ApplicationRecord
  has_many :category_article_joins, dependent: :destroy, inverse_of: :article
  has_many :categories, through: :category_article_joins, inverse_of: :articles
  has_many :favourite_articles_joins, dependent: :destroy, inverse_of: :article, class_name: 'FavouritedArticle'

  has_rich_text :content
  has_one_attached :card_image

  def get_image_url
    if card_image.attached?
      Rails.application.routes.url_helpers.rails_blob_path(card_image, only_path: true)
    else
      self.categories.to_a.first.get_image_url
    end
  end
end
