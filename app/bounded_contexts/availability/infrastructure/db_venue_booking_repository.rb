class Availablity::Infrastructure::DbVenueBookingRepository
  attr_reader :venue_booking, :event_store_writer

  def initialize(
    db_venue_booking_persistence: Availability::Infrastructure::DbVenueBooking,
    event_store_writer: EventStore::Write.new
  )

    @db_venue_booking_persistence = db_venue_booking_persistence
    @event_store_writer = event_store_writer
  end

  def create(venue_id:, date:)
    db_venue_booking_persistence.create!(venue_id:, date:)
  end

  def delete(venue_id:, date:)
    db_venue_booking_persistence.find_by(venue_id:, date:).destroy!
  end

  def venue_already_booked?(venue_id:, date:)
    db_venue_booking_persistence.exists?(venue_id:, date:)
  end
end
