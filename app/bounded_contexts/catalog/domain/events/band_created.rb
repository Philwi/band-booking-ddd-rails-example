class Catalog::Domain::Events::BandCreated
  attr_reader :name, :genre, :country, :city, :state, :price, :website, :facebook

  def initialize(name:, genre:, country:, city:, state:, price:, website:, facebook:)
    @name = name
    @genre = genre
    @country = country
    @city = city
    @state = state
    @price = price
    @website = website
    @facebook = facebook
  end
end
