class OwnedcurrencyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    record.portfolio.user == user
  end

  def create?
    true
  end
end
