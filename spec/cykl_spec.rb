require 'spec_helper'

RSpec.describe Cykl do
  it 'has a version number' do
    expect(Cykl::VERSION).not_to be nil
  end

  context '#time' do
    it 'calculates the average cycle time for the user/repo' do
      cykl_time = Cykl.time

      expect(cykl_time).to be_a_kind_of(IO)
    end
  end
end
