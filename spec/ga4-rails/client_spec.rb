RSpec.describe Ga4Rails::Client do
  let(:access_token) { 'test' }

  describe('#initialize') do
    it 'sets the access token' do
      client = described_class.new(access_token: access_token)
      expect(client.access_token).to eq(access_token)
    end
  end

  describe('list_accounts') do
    let(:analytics_admin_service) { double(list_accounts: true) }
    let(:client) { described_class.new(access_token: access_token) }

    before do
      allow(client).to receive(:analytics_admin_service).and_return(analytics_admin_service)
    end

    it 'calls the analytics admin service #list_accounts method' do
      client.list_accounts

      expect(analytics_admin_service).to have_received(:list_accounts)
    end
  end
end
