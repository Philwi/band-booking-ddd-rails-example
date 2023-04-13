class Booking::Infrastructure::DbContractRepository
  attr_reader :event_store_write, :db_contract_persistence

  def initialize(event_store_write: EventStore::Write.new, db_contract_persistence: Catalog::Infrastructure::DbContract)
    @event_store_write = event_store_write
    @db_contract_persistence = db_contract_persistence
  end

  def save(contract)
    db_contract = db_contract_persistence.find_by(id: contract.id) if contract.id
    db_contract ||= db_contract_persistence.new(id: contract.id)

    db_contract.assign_attributes(
      band_id: contract.band_id,
      venue_id: contract.venue_id,
      date: contract.date,
      price: contract.price,
      status: contract.status
    )

    ActiveRecord::Base.transaction do
      db_contract.save!

      commit_events(contract)
    end

    contract.id = db_contract.id
  end

  def contract_by_id(id)
    db_contract = db_contract_persistence.find_by(id:)

    return unless db_contract

    contract = Booking::Domain::Contract.new(id: db_contract.id)
    contract.band_id = db_contract.band_id
    contract.venue_id = db_contract.venue_id
    contract.date = db_contract.date
    contract.price = db_contract.price
    contract.status = db_contract.status

    contract
  end

  private

  def commit_events(contract)
    return if contract.uncommitted_events.blank?

    contract.uncommitted_events.each do |event|
      event.contract_id = contract.id
      event_store_write.call(event)
    end

    contract.clear_uncommitted_events
  end
end
