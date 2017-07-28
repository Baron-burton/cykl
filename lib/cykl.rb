require 'cykl/issues'
require 'cykl/version'

module Cykl
  class << self
    attr_reader :cycle_time
    private :cycle_time

    def time(repo = nil)
      print_and_flush "Pulling in your issues, please wait..."
      issues = Issues.new.list_issues(repo)
      @cycle_time = average_cycle_time(issues)

      print_and_flush(cycle_time_message)
    rescue Octokit::NotFound
      print_and_flush('Sorry, Github couldn\'t find anything')
    end

    private

    def cycle_time_message
      "Your average cycle time is #{cycle_time}" +
      (cycle_time == 1.00 ? 'day' : 'days')
    end

    def average_cycle_time(issues)
      lifetimes = []

      issues.each do |issue|
        lifetimes << ((issue.closed_at - issue.created_at) / seconds_in_a_day)
      end

      calculate_average(lifetimes)
    end

    def calculate_average(data)
      total = data.inject(:+)

      (total / data.count).round(2)
    end

    def seconds_in_a_day
      (24 * 60 * 60)
    end

    def print_and_flush(msg)
      print msg
      STDOUT.flush
    end
  end
end
