require 'spec_helper'
describe 'adgitops' do
  context 'with default values for all parameters' do
    it { should contain_class('adgitops') }
  end
end
