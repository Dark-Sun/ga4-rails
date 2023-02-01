RSpec.describe Ga4Rails::AnalyticsAdmin do
  describe('#initialize') do
    let(:instance) { described_class.new(access_token: 'test') }

    it 'sets the access token' do
      expect(instance.access_token).to eq('test')
    end
  end

  describe('#service') do
    before do
      allow(
        Google::Apis::AnalyticsadminV1alpha::GoogleAnalyticsAdminService
      ).to receive(:new).and_return(service)
    end

    let(:service) { OpenStruct.new(authorization: nil) }
    let(:instance) { described_class.new(access_token: 'test') }

    it 'sets the authorization' do
      expect(instance.service.authorization).to eq('test')
    end

    it 'returns the service' do
      expect(instance.service).to eq(service)
    end
  end
end
