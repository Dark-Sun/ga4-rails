RSpec.describe Ga4Rails::Request do
  describe('.call') do
    let(:instance) { described_class.call }

    it 'raises an error' do
      expect { instance }.to raise_error(NotImplementedError)
    end
  end
end
