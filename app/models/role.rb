class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy, inverse_of: :role
  has_many :users, through: :user_roles, inverse_of: :roles

end
