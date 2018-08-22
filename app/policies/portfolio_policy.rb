class PortfolioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.find_by(user: @user)
    end
  end

  def create?
    true
  end
end
