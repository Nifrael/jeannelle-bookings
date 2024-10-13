# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :therapist, :record

  def initialize(therapist, record)
    @therapist = therapist
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(therapist, scope)
      @therapist = therapist
      @scope = scope
    end

    def resolve
      raise NoMethodError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :therapist, :scope
  end
end
