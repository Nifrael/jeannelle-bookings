# test/models/availability_test.rb
require 'test_helper'

class AvailabilityTest < ActiveSupport::TestCase
  fixtures :therapists, :availabilities

  def setup
    @valid_availability = availabilities(:one)
  end

  test 'is invalid without a therapist' do
    @valid_availability.therapist = nil
    assert_not @valid_availability.save, "Saved the availability without a therapist"
  end

  test 'is invalid without a date' do
    @valid_availability.date = nil
    assert_not @valid_availability.valid?
    assert_includes @valid_availability.errors[:date], "can't be blank"
  end

  test 'is invalid without a start_time' do
    @valid_availability.start_time = nil
    assert_not @valid_availability.valid?
    # assert_includes @valid_availability.errors[:start_time], "can't be blank"
  end

  test 'is invalid without an end_time' do
    @valid_availability.end_time = nil
    assert_not @valid_availability.valid?
    # assert_includes @valid_availability.errors[:end_time], "can't be blank"
  end

  test 'is invalid if end_time is before start_time' do
    @valid_availability.end_time = Time.zone.parse('09:00')
    assert_not @valid_availability.valid?
    # assert_includes @valid_availability.errors[:end_time], "doit être après l'heure de début"
  end

  test 'is invalid if start_time is equal to end_time' do
    @valid_availability.start_time = Time.zone.parse('2024-10-07 10:00:00')
    @valid_availability.end_time = Time.zone.parse('2024-10-07 09:00:00')
    assert_not @valid_availability.valid?
    # assert_includes @valid_availability.errors[:end_time], "doit être après l'heure de début"
  end
end
