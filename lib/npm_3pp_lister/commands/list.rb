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
        file = File.read('./package.json')
        json = JSON.parse(file)

        json["dependencies"].each do |key, val|
          File.open("./3pp_list.txt","a") do |f|
            output.puts "#{key.colorize(:yellow)}: #{val}" + " " + "https://registry.npmjs.org/#{key}/-/#{key}-#{val.gsub("^", "").gsub("~", "")}.tgz".colorize(:green)
            f.puts "#{key}:#{val} - https://registry.npmjs.org/#{key}/-/#{key}-#{val.gsub("^", "").gsub("~", "")}.tgz"
          end
        end
        output.puts "\n\nResult written to 3pp_list.txt"
      end
    end
  end
end
