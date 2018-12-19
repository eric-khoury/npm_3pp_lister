# frozen_string_literal: true

require 'thor'

module Npm3ppLister
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'npm_3pp_lister version'
    def version
      require_relative 'version'
      puts "v#{Npm3ppLister::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'list', 'list all packages set as dependency (not devDependency)'
    method_option :help, aliases: '-h', type: :boolean, desc: 'Display commands'
    def list(*)
      if options[:help]
        invoke :help, ['list']
      else
        require_relative 'commands/list'
        Npm3ppLister::Commands::List.new(options).execute
      end
    end
    map %w(--l -l) => :list
  end
end
