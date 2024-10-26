class AvailabilityPolicy < ApplicationPolicy
  attr_reader :therapist, :availability

  def initialize(therapist, availability)
    @therapist = therapist
    @availability = availability
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    therapist.admin? || therapist == availability.therapist
  end

  def update?
    therapist.admin? || therapist == availability.therapist
  end

  def destroy?
    therapist.admin? || therapist == availability.therapist
  end

  class Scope < ApplicationPolicy::Scope

    def resolve
      scope.all
    end
  end
end
