require 'google/apis/analyticsdata_v1beta'

# A class for interacting with the Google Analytics Data API.
#
# @attr_reader [OAuth2::AccessToken] access_token -
#   the access token obtained from the Google OAuth2 flow
#
# @example
#   Initialize service:
#
#   service = Ga4Rails::AnalyticsData.new(access_token: access_token).service
#
#   Get the metadata for a property
#   service.get_property_metadata("properties/348443235/metadata")
#
#   Run a report for a property
#    body = {
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
#    request = Google::Apis::AnalyticsdataV1beta::RunReportRequest.new(body)
#    service.run_property_report("properties/341194148", request)

module Ga4Rails
  class AnalyticsData
    AnalyticsData = Google::Apis::AnalyticsdataV1beta

    attr_accessor :access_token

    def initialize(access_token:)
      @access_token = access_token
    end

    def service
      return @service if @service

      @service = AnalyticsData::AnalyticsDataService.new
      @service.authorization = access_token
      @service
    end
  end
end
