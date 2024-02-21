class User < ApplicationRecord
  EDITABLE_FIELDS = %i[first_name last_name alias avatar theme email password password_confirmation location].freeze

  include User::Mentions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  default_scope { eager_load(:roles) }

  has_many :news_letter_subscriptions, foreign_key: 'email', primary_key: 'email'

  has_many :user_roles, dependent: :destroy, inverse_of: :user
  has_many :roles, -> { where(archived: false) }, through: :user_roles, inverse_of: :users
  has_many :favourite_articles_joins, dependent: :destroy, inverse_of: :user, class_name: 'FavouritedArticle'
  has_many :favourite_articles, through: :favourite_articles_joins, source: :article

  has_many :comments, -> { where(archived: false) }, foreign_key: 'commenter_id', dependent: :destroy
  has_many :archived_comments, -> { where(archived: true) }, foreign_key: 'commenter_id', class_name: 'Comment', dependent: :destroy
  has_many :comment_replies, -> { where(archived: false) }, foreign_key: 'commenter_id', dependent: :destroy
  has_many :archived_comment_replies, -> { where(archived: true) }, foreign_key: 'commenter_id', class_name: 'CommentReply', dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end

  def can?(action, subject, *extra_args)
    ability.can?(action, subject, *extra_args)
  end

  def cant?(action, subject, *extra_args)
    ability.cant?(action, subject, *extra_args)
  end
  alias :cannot? :cant?

  def admin?
    roles.any? { |role| role.name == 'Admin' }
  end

  protected

  def ability
    @ability ||= Ability.new(self)
  end
end
