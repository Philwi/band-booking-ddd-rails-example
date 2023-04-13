class Catalog::Domain::Band
  private

  attr_reader :id, :uncommitted_events

  public

  attr_accessor :name, :genre, :country, :city, :state, :price, :website, :facebook

  def initialize(id: nil)
    @id = id
    @uncommitted_events = []
  end

  def increase_price(amount)
    @price += amount
    publish_event(Catalog::Domain::Events::BandPriceIncreased.new(price: @price, band_id: id))
  end

  def create_new_band
    publish_event(
      Catalog::Domain::Events::BandCreated.new(
        name: @name,
        genre: @genre,
        country: @country,
        city: @city,
        state: @state,
        price: @price,
        website: @website,
        facebook: @facebook
      )
    )
  end

  def clear_uncommitted_events
    @uncommitted_events = []
  end

  private

  def publish_event(event)
    @uncommitted_events << event
  end
end
