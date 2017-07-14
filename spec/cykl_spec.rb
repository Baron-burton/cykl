require 'spec_helper'

RSpec.describe Cykl do

  it 'has a version number' do
    expect(Cykl::VERSION).not_to be nil
  end

  context '#issues' do
    it 'retrieves the last 30 closed isses for a repo' do
      issues = Cykl.issues

      expect(issues.count).to eq(30)
      expect(issues.sample.state).to eq('closed')
    end
  end

  context '#time' do
    it 'calculates the average cycle time for the user/repo' do
      cykl_time = Cykl.time

      expect(cykl_time).to be_a(String)
      expect(cykl_time).to include('Your average cycle time is')
    end
  end
end
