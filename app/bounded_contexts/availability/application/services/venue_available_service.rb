class Availabilty::Application::Services::VenueAvailableService
  attr_reader :repository

  def initialize(repository: Availability::Infrastructure::DbVenueRepository.new)
    @repository = repository
  end

  def call(band_id:, date:)
    repository.venue_already_booked?(band_id:, date:)
  end
end
