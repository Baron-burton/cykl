require 'spec_helper'

RSpec.describe Cykl do
  it 'has a version number' do
    expect(Cykl::VERSION).not_to be nil
  end

  context '#time' do
    it 'outputs to STDOUT' do
      expect {
        Cykl::Initializer.start(['time'])
      }.to output(/Pulling in your issues from/).to_stdout
    end
  end
end
