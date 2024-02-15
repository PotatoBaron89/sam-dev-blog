# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    roles = user.roles.each do |role|
      case role.name
      when 'Admin'
        can :manage, :all
      when 'Registered User'
        can :read, :article
        can :read, :category, archived: false
        can :read, :user, id: user.id
      end
    end
  end

  def cant?(action, subject, *extra_args)
    !can?(action, subject, *extra_args)
  end
  alias :cannot? :cant?
end
