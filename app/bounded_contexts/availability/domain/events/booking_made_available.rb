class Availability::Domain::Events::BookingMadeAvailable
  attr_reader :band_ids, :venue_id, :date, :price

  def initialize(band_ids:, venue_id:, date:, price:)
    @band_ids = band_ids
    @venue_id = venue_id
    @date = date
    @price = price
  end
end
