RSpec.describe Ga4Rails::Model do
  let(:dummy) do
    Class.new do
      include Ga4Rails::Model

      metrics :test_metric
      dimensions :test_dimension
    end
  end

  describe('#metrics') do
    it 'sets the metrics' do
      expect(dummy.metrics).to eq(%i(test_metric))
    end
  end

  describe('#dimensions') do
    it 'sets the dimensions' do
      expect(dummy.dimensions).to eq(%i(test_dimension))
    end
  end

  describe('#results') do
    let(:client) { double('client') }
    let(:get_results!) do
      dummy.results(
        access_token: 'test',
        property_id: 'test',
        start_date: Date.new(2020, 1, 1),
        end_date: Date.new(2022, 1, 1)
      )
    end

    let(:response) do
      hash = {
        rows: [
          {
            dimension_values: [
              { value: 'test' }
            ],
            metric_values: [
              { value: 1 }
            ]
          }
        ]
      }
      
      JSON.parse(hash.to_json, object_class: OpenStruct)
    end

    before do
      allow(client).to receive(:run_property_report).and_return(
        double('response', response: response)
      )
      allow(Ga4Rails::Client).to receive(:new).and_return(client)
    end

    it 'calls the client to get report results' do
      get_results!

      expect(client).to have_received(:run_property_report).with(
        property_id: 'test',
        body: {
          date_ranges: [
            {
              start_date: '2020-01-01',
              end_date: '2022-01-01'
            }
          ],
          metrics: [
            { name: :testMetric }
          ],
          dimensions: [
            { name: :testDimension }
          ],
          limit: 1000
        }
      )
    end

    it 'returns the response' do
      results = get_results!

      expect(results).to eq([{ dimensions: 'test', metrics: '1' }])
    end
  end
end
