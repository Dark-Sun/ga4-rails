require 'google/apis/analyticsadmin_v1alpha'

module Ga4Rails
  class AnalyticsAdmin
    Analyticsadmin = Google::Apis::AnalyticsadminV1alpha

    attr_accessor :access_token

    def initialize(access_token:)
      @access_token = access_token
    end

    def service
      return @service if @service

      @service = Analyticsadmin::GoogleAnalyticsAdminService.new
      @service.authorization = access_token
      @service
    end
  end
end
