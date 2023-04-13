class Booking::Application::Handlers::SignContractHandler
  private

  attr_reader :repository

  public

  def initialize(repository: Booking::Infrastructure::DbContractRepository.new)
    @repository = repository
  end

  def call(band_id:, venue_id:, date:)
    contract = Booking::Domain::Contract.new
    contract.band_id = band_id
    contract.venue_id = venue_id
    contract.date = date
    contract.status = 'pending'

    contract.create_new_contract
    repository.save(contract)
  end
end
