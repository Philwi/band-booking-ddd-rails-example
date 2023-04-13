class Catalog::Infrastructure::DbBandRepository
  attr_reader :event_store_write, :db_band_persistence

  def initialize(event_store_write: EventStore::Write.new, db_band_persistence: Catalog::Infrastructure::DbBand)
    @event_store_write = event_store_write
    @db_band_persistence = db_band_persistence
  end

  def save(band)
    db_band = db_band_persistence.find_by(id: band.id) if band.id
    db_band ||= db_band_persistence.new(id: band.id)

    db_band.assign_attributes(
      name: band.name,
      genre: band.genre,
      country: band.country,
      city: band.city,
      state: band.state,
      price: band.price,
      website: band.website,
      facebook: band.facebook
    )

    ActiveRecord::Base.transaction do
      db_band.save!

      commit_events(band)
    end

    band.id = db_band.id
  end

  def band_by_id(id)
    db_band = db_band_persistence.find_by(id:)

    return unless db_band

    band = Catalog::Domain::Band.new(id: db_band.id)
    band.name = db_band.name
    band.genre = db_band.genre
    band.country = db_band.country
    band.city = db_band.city
    band.state = db_band.state
    band.price = db_band.price
    band.website = db_band.website
    band.facebook = db_band.facebook

    band
  end

  private

  def commit_events(band)
    return if band.uncommitted_events.blank?

    band.uncommitted_events.each do |event|
      event.band_id = band.id
      event_store_write.call(event)
    end

    band.clear_uncommitted_events
  end
end
