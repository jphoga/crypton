class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def posts?
    true
  end

  def favorites?
    true
  end

  def remove_favorites?
    true
  end
end
