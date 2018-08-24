class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
     true
  end

  def destroy?
    record.user == user
  end

  def posts?
    true
  end

  def upvote?
    record.user != user
  end

  def downvote?
    record.user != user
  end
end
