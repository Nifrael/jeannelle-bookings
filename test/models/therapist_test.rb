require "test_helper"

class TherapistTest < ActiveSupport::TestCase
  test "should not save therapist without first_name" do
    therapist = Therapist.new(last_name: "Lol", email: "empty@gmail.com")
    assert_not therapist.save, "Saved the therapist without a first_name"
  end

  test "should not save therapist without last_name" do
    therapist = Therapist.new(first_name: "Lol", email: "empty@gmail.com")
    assert_not therapist.save, "Saved the therapist without a last_name"
  end

  test "should not save therapist without email" do
    therapist = Therapist.new(first_name: "Lol", last_name: "empty")
    assert_not therapist.save, "Saved the therapist without email"
  end

  test "should not save therapist without password" do
    therapist = Therapist.new(first_name: "Lol", last_name: "empty")
    assert_not therapist.save, "Saved the therapist without password"
  end

    test "should assign default role when none is provided" do
    therapist = Therapist.new(first_name: "Lol", last_name: "empty")
    therapist.save
    assert_equal "therapist", therapist.role, "Therapist was not assigned the default role"
  end
end
