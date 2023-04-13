class Catalog::Domain::Events::BandPriceIncreased
  attr_reader :price, :band_id

  def initialize(price:, band_id:)
    @price = price
    @band_id = band_id
  end
end
