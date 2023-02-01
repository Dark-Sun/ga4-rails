# A class for running GA Data Api property report.
#
# @attr_reader [Ga4Rails::AnalyticsData] data_service -
#   the data service wraper to run the report
#
# @attr_reader [String] property_id -
#   the GA4 roperty ID, example: 'properties/341194148'
#
# @attr_reader [String] body -
#   the report request body, example:
#     body = {
#      "date_ranges": [
#        {
#          "start_date": "30daysAgo",
#          "end_date": "today"
#        }
#      ],
#      "metrics": [
#        { name: "totalUsers" }
#      ]
#    }
#
# Usage:
# response = Ga4Rails::RunPropertyReport.new(
#   data_service: data_service,
#   property_id: property_id,
#   body: body
# ).response

class Ga4Rails::RunPropertyReport < Ga4Rails::Request
  attr_accessor :data_service, :property_id, :body, :response

  def initialize(data_service:, property_id:, body:)
    @data_service = data_service
    @property_id = property_id
    @body = body
  end

  def call
    request = Google::Apis::AnalyticsdataV1beta::RunReportRequest.new(body)
    @response = data_service.run_property_report(property_id, request)

    self
  end
end
