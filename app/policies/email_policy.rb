class EmailPolicy < ApplicationPolicy
  def index?
    scope.count > 0
  end
  alias_method :show?, :index?

  def create?
    @record.user_id == user.id
  end

  def permitted_attributes
    [:subject, :body]
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where(user_id: user)
    end
  end
end