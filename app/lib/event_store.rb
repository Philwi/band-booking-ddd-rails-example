# frozen_string_literal: true

module EventStore
  HANDLERS = {
    Booking::Domain::Events::ContractCreated => [Availability::Application::Handlers::ContractCreatedHandler#,
                                                # Application::Handlers::ContractCreatedHandler => write read model
                                                ]
    # does not exist yet but it could be possible
    # Booking::Domain::Events::ContractUnbooked => [Availability::Application::Handlers::ContractUnbookedHandler],
    # Catalog::Domain::Events::BandDeleted => [
    #                                           Availability::Application::Handlers::BandDeletedHandler,
    #                                           Booking::Application::Handlers::BandDeletedHandler
    #                                         ]
  }.freeze

  Write = Class.new do
    def call(event)
      handlers = HANDLERS[event.class] ||= []
      return if handlers.blank?

      handlers.each do |handler_class|
        handler = handler_class.new
        handler.call(event)
      end
    end
  end
end
