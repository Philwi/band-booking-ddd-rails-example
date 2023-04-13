class Availabilty::Infrastructure::DbBandBookingRepository
  attr_reader :event_store_writer, :db_band_booking_persistence

  def initialize(event_store_writer: EventStore::Write.new, db_band_booking_persistence: Availability::Infrastructure::DbBandBooking)
    @event_store_writer = event_store_writer
    @db_band_booking_persistence = db_band_booking_persistence
  end

  def create(band_id:, date:, venue_id:)
    db_band_booking = db_band_booking_persistence.new
    db_band_booking.assign_attributes(band_id:, date:, venue_id:)
    db_band_booking.save!
  end

  def delete(band_id:, date:)
    db_band_booking = db_band_booking_persistence.find_by(band_id:, date:)
    db_band_booking.destroy!
  end

  def band_already_booked?(band_id:, date:)
    db_band_booking = db_band_booking_persistence.find_by(band_id:, date:)

    db_band_booking.present?
  end
end
