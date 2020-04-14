# frozen_string_literal: true

require_relative '../command'
require 'json'
require 'colorize'

module Npm3ppLister
  module Commands
    class List < Npm3ppLister::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        if File.file?('./package.json')
          file = File.read('./package.json')
          json = JSON.parse(file)

          output.puts "dependencies:"
          output.puts "\n"
          json["dependencies"].each do |key, val|
            source_code_url = `npm view #{key}@#{val} dist.tarball`
            output.puts "#{key.colorize(:yellow)}: #{val}" + " " + source_code_url.colorize(:green)
          end

          output.puts "\n\n\n"
          output.puts "devDependencies:"
          output.puts "\n"
          json["devDependencies"].each do |key, val|
            source_code_url = `npm view #{key}@#{val} dist.tarball`
            output.puts "#{key.colorize(:yellow)}: #{val}" + " " + source_code_url.colorize(:green)
          end

        else
          output.puts "- No package.json found here -"
        end
      end
    end
  end
end
