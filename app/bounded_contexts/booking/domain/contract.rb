class Booking::Domain::Contract
  attr_reader :id

  attr_accessor :band_id, :venue_id, :date, :price, :status

  def initialize(id: nil)
    @id = id
    @uncommitted_events = []
  end

  def create_new_contract
    publish_event(
      Booking::Domain::Events::ContractCreated.new(
        band_id: @band_id,
        venue_id: @venue_id,
        date: @date,
        price: @price,
        status: @status
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
