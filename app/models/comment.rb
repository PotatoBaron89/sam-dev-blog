class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: 'User', foreign_key: 'commenter_id'

  has_many :comment_replies, -> { where(archived: false) }, dependent: :destroy, inverse_of: :comment

  def commenter_name
    commenter.name.presence || commenter.email
  end

  def editted?
    created_at != updated_at
  end
end
