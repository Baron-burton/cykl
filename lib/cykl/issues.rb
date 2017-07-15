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

    def list_issues(repo = nil)
      client.issues(
        repo,
        state: 'closed',
        per_page: 100
      )
    end
  end
end
