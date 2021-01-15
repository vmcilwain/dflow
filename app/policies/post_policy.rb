class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.role? :administrator
  end

  alias index? new?
  alias create? new?
  alias edit? new?
  alias update? new?
  alias destroy? new?
end
