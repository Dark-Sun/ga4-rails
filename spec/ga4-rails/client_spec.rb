RSpec.describe Ga4Rails::Client do
  let(:access_token) { 'test' }

  describe('#initialize') do
    it 'sets the access token' do
      client = described_class.new(access_token: access_token)
      expect(client.access_token).to eq(access_token)
    end
  end

  describe('#admin') do
    it 'returns an instance of GoogleAnalyticsAdminService' do
      client = described_class.new(access_token: access_token)
      expect(client.admin).to be_an_instance_of(
        Google::Apis::AnalyticsadminV1alpha::GoogleAnalyticsAdminService
      )
    end
  end

  describe('#data') do
    it 'returns an instance of AnalyticsDataService' do
      client = described_class.new(access_token: access_token)
      expect(client.data).to be_an_instance_of(
        Google::Apis::AnalyticsdataV1beta::AnalyticsDataService
      )
    end
  end
end
