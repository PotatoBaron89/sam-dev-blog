class NewsLetterSubscription < ApplicationRecord
  validates :email, uniqueness: true
end
