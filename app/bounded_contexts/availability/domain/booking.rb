class Availability::Domain::Booking
  attr_reader :id

  attr_accessor :band_ids, :venue_id, :date, :price, :available

  def initialize(id: nil)
    @id = id
    @uncommitted_events = []
    @available = true
  end

  def make_unavailable
    self.available = false

    publish_event(
      Availability::Domain::Events::BookingMadeUnavailable.new(
        band_ids: @band_ids,
        venue_id: @venue_id,
        date: @date,
        price: @price
      )
    )
  end

  def make_available
    self.available = true

    publish_event(
      Availability::Domain::Events::BookingMadeAvailable.new(
        band_ids: @band_ids,
        venue_id: @venue_id,
        date: @date,
        price: @price
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
