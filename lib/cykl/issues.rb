require 'octokit'

module Cykl
  class Issues

    attr_reader :client
    private :client

    def initialize
      @client = Octokit::Client.new(
        netrc: true
      )
    end

    def list_issues(repo = nil, options)
      pr_free_issues = []
      counter = 1

      while pr_free_issues.count < 50
        issues = get_issues(repo, counter, options)
        issues.select { |issue| pr_free_issues << issue if issue.pull_request == nil }
        counter += 1
      end
      pr_free_issues
    end

    def get_issues(repo = nil, page, options)
      client.issues(
        repo,
        state: 'closed',
        per_page: 100,
        page: page,
        labels: options[:label]
      )
    end
  end
end
