class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def create?
      return true
    end

    def update?
      record.user == user
    end

    def resolve
      scope.all
    end

    def destroy?
      record.user == user
    end
  end
end
