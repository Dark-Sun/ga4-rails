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

  describe('#available_metrics') do
    before do
      allow(Ga4Rails::GetPropertyMetadata).to receive(:call).and_return(get_property_metadata)
      allow(get_property_metadata).to receive(:metrics).and_return(true)
    end

    let(:get_property_metadata) { double('metadata_instance') }

    it 'calls GetPropertyMetadata to get metrics' do
      client = described_class.new(access_token: access_token)
      client.available_metrics(property: 'test')

      expect(get_property_metadata).to have_received(:metrics)
    end
  end

  describe('#available_dimensions') do
    before do
      allow(Ga4Rails::GetPropertyMetadata).to receive(:call).and_return(get_property_metadata)
      allow(get_property_metadata).to receive(:dimensions).and_return(true)
    end

    let(:get_property_metadata) { double('metadata_instance') }

    it 'calls GetPropertyMetadata to get metrics' do
      client = described_class.new(access_token: access_token)
      client.available_dimensions(property: 'test')

      expect(get_property_metadata).to have_received(:dimensions)
    end
  end

  describe('#run_property_report') do
    before do
      allow(Ga4Rails::RunPropertyReport).to receive(:call).and_return(true)
    end

    let!(:result) do
      client = described_class.new(access_token: access_token)
      client.run_property_report(
        property_id: 'test',
        body: {}
      )
    end

    it 'calls Ga4Rails::RunPropertyRepor' do
      expect(Ga4Rails::RunPropertyReport).to have_received(:call)
    end

    it 'returns the result' do
      expect(result).to eq(true)
    end
  end
end
