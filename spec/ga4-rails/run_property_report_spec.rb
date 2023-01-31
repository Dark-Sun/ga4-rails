RSpec.describe Ga4Rails::RunPropertyReport do
  describe('#initialize') do
    let(:data_service) { double('data_service') }
    let(:instance) do
      described_class.new(
        data_service: data_service,
        property_id: 'property_id',
        body: 'body'
      )
    end

    before do
      allow(data_service).to receive(:run_property_report).and_return('report')
      allow(
        Google::Apis::AnalyticsdataV1beta::RunReportRequest
      ).to receive(:new).and_return('request')
    end

    it 'sets the data service' do
      expect(instance.data_service).to eq(data_service)
    end

    it 'sets the property ID' do
      expect(instance.property_id).to eq('property_id')
    end

    it 'sets the body' do
      expect(instance.body).to eq('body')
    end

    it 'runs the report' do
      expect(instance.response).to eq('report')
    end
  end
end
