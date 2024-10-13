require 'test_helper'

class TherapistPolicyTest < ActiveSupport::TestCase

  def setup
    @admin = therapists(:admin)
    @admin2 = therapists(:admin2)
    @therapist = therapists(:therapist)
    @therapist2 = therapists(:therapist2)
  end

  def test_scope
    scope = Pundit.policy_scope(@admin, Therapist)
    assert_includes scope, @admin
    assert_includes scope, @therapist

    scope = Pundit.policy_scope(@therapist, Therapist)
    assert_includes scope, @admin
    assert_includes scope, @therapist
  end

  def test_show
    assert Pundit.policy(@admin, @therapist).show?
    assert Pundit.policy(@admin, @admin).show?

    assert Pundit.policy(@therapist, @admin).show?
    assert Pundit.policy(@therapist, @admin).show?
  end

  def test_create
    assert Pundit.policy(@admin, @therapist).create?
    assert Pundit.policy(@admin, @admin).create?

    refute Pundit.policy(@therapist, @therapist).create?
    refute Pundit.policy(@therapist, @admin).create?
  end

  def test_update
    assert Pundit.policy(@admin, @therapist).update?
    assert Pundit.policy(@admin, @admin).update?

    refute Pundit.policy(@admin, @admin2).update?
    refute Pundit.policy(@admin2, @admin).update?

    assert Pundit.policy(@therapist, @therapist).update?
    refute Pundit.policy(@therapist, @admin).update?

    refute Pundit.policy(@therapist, @therapist2).update?
    refute Pundit.policy(@therapist2, @therapist).update?
  end

  def test_destroy
    assert Pundit.policy(@admin, @therapist).destroy?
    refute Pundit.policy(@admin, @admin).destroy?

    refute Pundit.policy(@admin, @admin2).destroy?
    refute Pundit.policy(@admin2, @admin).destroy?

    refute Pundit.policy(@therapist, @therapist).destroy?
    refute Pundit.policy(@therapist, @admin).destroy?

    refute Pundit.policy(@therapist, @therapist2).destroy?
    refute Pundit.policy(@therapist2, @therapist).destroy?
  end
end
