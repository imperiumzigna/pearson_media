# frozen_string_literal: true

class StoryPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    create?
  end

  def create?
    user.editor?
  end
end
