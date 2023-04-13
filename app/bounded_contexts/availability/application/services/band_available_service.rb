class Availabilty::Application::Services::BandAvailableService
  attr_reader :repository

  def initialize(repository: Availability::Infrastructure::DbBookingRepository.new)
    @repository = repository
  end

  def call(band_id:, date:)
    repository.band_already_booked?(band_id:, date:)
  end
end
