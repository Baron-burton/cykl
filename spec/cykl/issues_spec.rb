require 'spec_helper'

module Cykl
  RSpec.describe Issues do
    context '#list_issues' do
      let(:subject) { described_class.new }

      it 'retrieves at least 50 closed isses for a repo' do
        issues = subject.list_issues(nil, {})

        expect(issues.count).to be >= 50
        expect(issues.sample.state).to eq('closed')
      end
    end
  end
end
