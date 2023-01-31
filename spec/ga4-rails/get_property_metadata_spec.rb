RSpec.describe Ga4Rails::GetPropertyMetadata do
  describe('#initialize') do
    let(:data_service) { double('data_service') }
    let(:instance) do
      described_class.new(
        data_service: data_service,
        property_id: 'property_id'
      )
    end

    before do
      allow(data_service).to receive(:get_property_metadata).and_return({})
    end

    it 'sets the data service' do
      expect(instance.data_service).to eq(data_service)
    end

    it 'sets the property ID' do
      expect(instance.property_id).to eq('property_id')
    end
  end

  context('getting metadata') do
    let(:data_service) { double('data_service') }

    let(:instance) do
      described_class.new(
        data_service: data_service,
        property_id: 'property_id'
      )
    end

    before do
      allow(data_service).to receive(:get_property_metadata).and_return(
        OpenStruct.new(
          metrics: %w(metric1 metric2),
          dimensions: %w(dimension1 dimension2)
        )
      )
    end

    describe('#metrics') do
      it 'returns the metrics' do
        expect(instance.metrics).to eq(%w(metric1 metric2))
      end
    end

    describe('#dimensions') do
      it 'returns the dimensions' do
        expect(instance.dimensions).to eq(%w(dimension1 dimension2))
      end
    end
  end
end
