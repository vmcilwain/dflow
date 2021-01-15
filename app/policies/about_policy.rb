class AboutPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.role? :administrator
  end

  alias create? new?
  alias edit? new?
  alias update? new?
end
