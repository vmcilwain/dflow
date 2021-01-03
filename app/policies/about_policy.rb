class AboutPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.has_role? :administrator
  end
  
  alias_method :create?, :new?
  alias_method :edit?, :new?
  alias_method :update?, :new?
end
