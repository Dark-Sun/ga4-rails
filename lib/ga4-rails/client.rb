require_relative 'analytics_admin'

# A client for interacting with the Google Analytics API.
#
# @attr_reader [OAuth2::AccessToken] access_token -
#   the access token obtained from the Google OAuth2 flow
#
# @example
#   client = Ga4Rails::Client.new(access_token: access_token)
#   client.admin.list_account_summaries
class Ga4Rails::Client
  attr_reader :access_token

  # Initializes a new client.
  #
  # @param access_token [OAuth2::AccessToken] -
  #   the access token obtained from the Google OAuth2 flow
  def initialize(access_token:)
    @access_token = access_token
  end

  # Returns an instance of the AnalyticsAdmin class.
  #
  # @return [Ga4Rails::AnalyticsAdmin] -
  #   an instance of the AnalyticsAdmin class
  def admin
    analytics_admin_service
  end

  private

  def analytics_admin_service
    @analytics_admin_service ||= Ga4Rails::AnalyticsAdmin.new(
      access_token: access_token
    ).service
  end
end