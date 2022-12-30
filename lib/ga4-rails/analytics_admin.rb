require 'google/apis/analyticsadmin_v1alpha'

# A class for interacting with the Google Analytics Admin API.
#
# @attr_reader [OAuth2::AccessToken] access_token -
#   the access token obtained from the Google OAuth2 flow
#
# @example
#   analytics_admin = Ga4Rails::AnalyticsAdmin.new(access_token: access_token)
#   analytics_admin.service.list_account_summaries

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
