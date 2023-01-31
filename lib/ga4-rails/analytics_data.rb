require 'google/apis/analyticsdata_v1beta'

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
