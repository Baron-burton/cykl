require 'thor'

module Cykl
  class Initializer < Thor
    attr_reader :cycle_time
    private :cycle_time


    desc 'time REPO', 'returns the average cycle time for your repo'
    method_option(
      :label,
      type: :string,
      aliases: '-l',
      lazy_default: '',
      desc: 'search for repositories with a given label'
    )

    def time(repo = nil)
      initializer_message(repo, options)
      list_of_issues(repo, options)

      puts_and_flush(cycle_time_message)
    rescue Octokit::NotFound
      puts_and_flush('Sorry, Github couldn\'t find anything')
    end

    private

    def list_of_issues(repo, options)
      issues = Issues.new.list_issues(repo, options)
      @cycle_time = average_cycle_time(issues)
    end

    def cycle_time_message
      "\nYour average cycle time is #{cycle_time}" +
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

    def initializer_message(repo, options)
      if options.any? && !options[:label].empty?
        puts_and_flush(
          "Attempting to pull in your #{options[:label]} issues \n" +
          "from #{repo}, please wait..."
        )
      else
        puts_and_flush("Pulling in your issues from #{repo}, please wait...")
      end
    end

    def puts_and_flush(msg)
      puts msg
      STDOUT.flush
    end
  end
end
