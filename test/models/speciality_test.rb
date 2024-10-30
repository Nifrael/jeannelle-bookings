require "test_helper"

class SpecialityTest < ActiveSupport::TestCase
  test "should not save speciality without name" do
    speciality = Speciality.new(default_max_attendance: 10)
    assert_not speciality.save, "Saved the speciality without a name"
  end
end
