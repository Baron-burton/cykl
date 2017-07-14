require 'cykl/issues'
require 'cykl/version'

module Cykl

  class << self

    def issues(repo = nil)
      Issues.new.list_issues(repo)
    end

    def time(repo = nil)
      issues = Issues.new.list_issues(repo)

      "Your average cycle time is #{average_cycle_time(issues)} days!"
    end

    private

    def average_cycle_time(issues)
      lifetimes = []

      issues.each do |issue|
        lifetimes << ((issue.closed_at - issue.created_at) / seconds_in_a_day)
      end

      calculate_average(lifetimes)
    end

    def calculate_average(data)
      total = data.inject(:+)

      (total / data.count).round
    end

    def seconds_in_a_day
      (24 * 60 * 60)
    end
  end
end
