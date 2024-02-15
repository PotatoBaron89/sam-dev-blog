class User < ApplicationRecord
  EDITABLE_FIELDS = %i[first_name last_name alias email password password_confirmation location].freeze

  include User::Mentions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  default_scope { eager_load(:roles) }

  has_many :user_roles, dependent: :destroy, inverse_of: :user
  has_many :roles, -> { where(archived: false) }, through: :user_roles, inverse_of: :users

  def can?(action, subject, *extra_args)
    ability.can?(action, subject, *extra_args)
  end

  def cant?(action, subject, *extra_args)
    ability.cant?(action, subject, *extra_args)
  end
  alias :cannot? :cant?

  protected

  def ability
    @ability ||= Ability.new(self)
  end
end
