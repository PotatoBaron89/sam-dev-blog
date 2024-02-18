class CommentReply < ApplicationRecord
  belongs_to :comment, inverse_of: :comment_replies
  belongs_to :commenter, class_name: 'User', foreign_key: 'user_id'
end
