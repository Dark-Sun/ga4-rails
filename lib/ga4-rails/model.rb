module Ga4Rails::Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    using Camelize

    DATE_FORMAT = '%Y-%m-%d'.freeze

    def metrics(*metrics)
      @metrics ||= metrics
    end

    def dimensions(*dimensions)
      @dimensions ||= dimensions
    end

    def results(access_token:, property_id:, start_date:, end_date:, limit: 1000)
      client = Ga4Rails::Client.new(access_token: access_token)

      response = client.run_property_report(
        property_id: property_id,
        body: build_body(start_date: start_date, end_date: end_date, limit: limit)
      ).response

      beautify_response(response)
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
      body[:metrics] = @metrics.map { |metric| { name: metric.camelize(:lower) } }
      body[:dimensions] = @dimensions.map { |dimension| { name: dimension.camelize(:lower) } }
      body[:limit] = limit

      body
    end

    def beautify_response(response)
      return [] if response&.rows.nil?

      response.rows.map do |row|
        {
          dimensions: dimensions_for(row),
          metrics: metrics_for(row)
        }
      end
    end

    def dimensions_for(row)
      row.dimension_values.each_with_index.inject({}) do |result, (item, index)|
        result[dimensions[index]] = item.value
        result
      end
    end

    def metrics_for(row)
      row.metric_values.each_with_index.inject({}) do |result, (item, index)|
        result[metrics[index]] = item.value
        result
      end
    end
  end
end
