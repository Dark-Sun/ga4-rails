# A class for running GA Data Api property report.
#
# @attr_reader [Ga4Rails::AnalyticsData] data_service -
#   the data service wraper to run the report
#
# @attr_reader [String] property_id -
#   the GA4 roperty ID, example: 'properties/341194148'
#
# Usage:
# metrics = Ga4Rails::GetPropertyMetadata.new(
#   data_service: data_service,
#   property_id: property_id
# ).metrics
# dimensions = Ga4Rails::GetPropertyMetadata.new(
#   data_service: data_service,
#   property_id: property_id
# ).dimensions

class Ga4Rails::GetPropertyMetadata
  attr_accessor :data_service, :property_id, :response

  def initialize(data_service:, property_id:)
    @data_service = data_service
    @property_id = property_id

    run!
  end

  def metrics
    @metrics ||= JSON.parse(response.metrics.to_json)
  end

  def dimensions
    @dimensions ||= JSON.parse(response.dimensions.to_json)
  end

  private

  def run!
    @response = data_service.get_property_metadata("#{property_id}/metadata")
  end
end
