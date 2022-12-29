module Ga4Rails
  require_relative 'analytics_admin'

  class Client
    extend Forwardable

    attr_accessor :access_token

    # @param access_token [OAuth2::AccessToken] -
    # the access token obtained from the Google OAuth2 flow
    def initialize(access_token:)
      @access_token = access_token
    end

    def admin
      analytics_admin_service
    end

    private

    def analytics_admin_service
      @analytics_admin_service ||= ::Client::AnalyticsAdmin.new(
        access_token: access_token
      ).service
    end
  end
end
