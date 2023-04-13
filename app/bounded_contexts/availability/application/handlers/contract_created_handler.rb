class Availablity::Application::Handlers::ContractCreatedHandler
  def call(event)
    band_id = event.band_id
    venue_id = event.venue_id
    date = event.date

    db_band_booking_repository.create(band_id:, date:, venue_id:)
    db_venue_booking_repository.create(venue_id:, date:)
  end

  private

  def db_band_booking_repository
    @db_band_booking_repository ||= Availablity::Infrastructure::DbBandBookingRepository.new
  end

  def db_venue_booking_repository
    @db_venue_booking_repository ||= Availablity::Infrastructure::DbVenueBookingRepository.new
  end
end
