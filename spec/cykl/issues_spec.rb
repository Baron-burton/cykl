require 'spec_helper'

module Cykl
  RSpec.describe Issues do
    context '#list_issues' do
      let(:subject) { described_class.new }

      it 'retrieves the last 30 closed isses for a repo' do
        issues = subject.list_issues

        expect(issues.count).to eq(30)
        expect(issues.sample.state).to eq('closed')
      end
    end
  end
end
