class FavouritedArticle < ApplicationRecord
  belongs_to :user, inverse_of: :favourite_articles_joins
  belongs_to :article, inverse_of: :favourite_articles_joins
end
