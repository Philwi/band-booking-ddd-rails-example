class Catalog::Application::Services::CreateBandService
  private

  attr_reader :repository

  public

  def initialize(repository: Catalog::Infrastructure::DbBandRepository.new)
    @repository = repository
  end

  def call(name:, genre:, country:, city:, state:, price:, website:, facebook:)
    band = Catalog::Domain::Band.new
    band.name = name
    band.genre = genre
    band.country = country
    band.city = city
    band.state = state
    band.price = price
    band.website = website
    band.facebook = facebook

    band.create_new_band
    repository.save(band)
  end
end
