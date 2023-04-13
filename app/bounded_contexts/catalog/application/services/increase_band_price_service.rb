class Catalog::Application::Services::IncreaseBandPriceService
  private

  attr_reader :repository

  public

  def initialize(repository: Catalog::Infrastructure::DbBandRepository.new)
    @repository = repository
  end

  def call(band_id:, amount:)
    band = repository.band_by_id(band_id)
    band.increase_price(amount)

    repository.save(band)
  end
end
