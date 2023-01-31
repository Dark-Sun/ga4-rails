module Ga4Rails::Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    DATE_FORMAT = '%Y-%m-%d'.freeze

    def metrics(*metrics)
      @metrics ||= metrics
    end

    def dimensions(*dimensions)
      @dimensions ||= dimensions
    end

    def results(access_token:, property_id:, start_date:, end_date:, limit: 1000)
      client = Ga4Rails::Client.new(access_token: access_token)

      # TODO: Handle response
      client.run_property_report(
        property_id: property_id,
        body: build_body(start_date: start_date, end_date: end_date, limit: limit)
      ).response
    end

    private

    def build_body(start_date:, end_date:, limit:)
      body = {}
      body[:date_ranges] = [
        {
          start_date: start_date.strftime(DATE_FORMAT),
          end_date: end_date.strftime(DATE_FORMAT)
        }
      ]
      body[:metrics] = @metrics.map { |metric| { name: metric } }
      body[:dimensions] = @dimensions.map { |dimension| { name: dimension } }
      body[:limit] = limit
      
      body
    end
  end
end
