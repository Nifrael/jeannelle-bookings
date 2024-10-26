require 'test_helper'

class AvailabilityPolicyTest < ActiveSupport::TestCase

  def setup
    @admin = therapists(:admin)
    @therapist = therapists(:therapist)
    @therapist2 = therapists(:therapist2)
    @availability = availabilities(:one)
    @availability2 = availabilities(:two)
    @availability3 = availabilities(:three)
  end
  def test_scope
    scope = Pundit.policy_scope(@admin, Availability)
    assert_includes scope, @availability2
    assert_includes scope, @availability

    scope = Pundit.policy_scope(@therapist, Availability)
    assert_includes scope, @availability
    assert_includes scope, @availability2
    assert_includes scope, @availability3
  end

  def test_show
    assert Pundit.policy(@admin, @availability).show?
    assert Pundit.policy(@admin, @availability2).show?
    assert Pundit.policy(@therapist, @availability2).show?
    assert Pundit.policy(@therapist, @availability3).show?
  end

  def test_create
    assert Pundit.policy(@admin, @availability).create?
    assert Pundit.policy(@admin, @availability3).create?
    assert Pundit.policy(@therapist, @availability2).create?
    refute Pundit.policy(@therapist, @availability3).create?
  end

  def test_update
    assert Pundit.policy(@admin, @availability).update?
    assert Pundit.policy(@admin, @availability3).update?
    assert Pundit.policy(@therapist, @availability2).update?
    refute Pundit.policy(@therapist, @availability3).update?
  end

  def test_destroy
    assert Pundit.policy(@admin, @availability).destroy?
    assert Pundit.policy(@admin, @availability3).destroy?
    assert Pundit.policy(@therapist, @availability2).destroy?
    refute Pundit.policy(@therapist, @availability3).destroy?
  end
end
