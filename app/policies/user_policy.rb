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

  def follow?
    @record != @user
  end

  def unfollow?
    @record != @user
  end

end
