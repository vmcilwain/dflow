class AboutPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return false unless user
    user.role? :administrator
  end

  alias create? new?
  alias edit? new?
  alias update? new?
end
