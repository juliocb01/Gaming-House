class BootcampPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def resolve
    scope.all
    # For a multi-tenant SaaS app, you may want to use:
    # scope.where(user: user)
  end

  def destroy?
    record.user == user
  end
end
