class Availablitiy::Application::Services::BookService
  private

  attr_reader :repository

  public

  def initialize(repository: Availability::Infrastructure::DbBookingRepository.new)
    @repository = repository
  end

  def call(band_ids:, date:, venue_id:, price:)
    return unless bands_available?(band_ids:, date:) || venue_available?(venue_id:, date:)

    booking = Availability::Domain::Booking.new
    booking.band_ids = band_ids
    booking.date = date
    booking.venue_id = venue_id
    booking.price = price

    booking.book
    repository.save(booking)
  end

  private

  def bands_available?(band_ids:, date:)
    band_ids.all? do |band_id|
      Availability::Infrastructure::DbBandAvailabilityRepository.new.band_already_booked?(band_id:, date:)
    end
  end

  def venue_available?(venue_id:, date:)
    Availability::Infrastructure::DbVenueAvailabilityRepository.new.venue_already_booked?(venue_id:, date:)
  end
end
