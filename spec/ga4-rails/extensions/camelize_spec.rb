
using Camelize

RSpec.describe String do
  describe('#camelize') do
    context('with no arguments') do
      it 'converts string from snake_case to camelCase' do
        expect('test_string'.camelize).to eq('TestString')
      end
    end
    
    context('with :lower argument') do
      it 'converts string from snake_case to camelCase, first letter remains lowercase' do
        expect('test_string'.camelize(:lower)).to eq('testString')
      end
    end
  end
end
