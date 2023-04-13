class Booking::Domain::Events::ContractCreated
  attr_reader :band_id, :venue_id, :date, :price, :status

  def initialize(band_id:, venue_id:, date:, price:, status:)
    @band_id = band_id
    @venue_id = venue_id
    @date = date
    @price = price
    @status = status
  end
end
