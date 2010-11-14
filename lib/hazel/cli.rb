$:.unshift(File.expand_path('..', __FILE__))

require 'hazel/version'
require 'rubygems'
require 'thor'

module Hazel
  class CLI < Thor
    include Thor::Base
    include Thor::Actions
    
    desc 'setup [PATH]', 'Setup a new Hazel instance'
    def setup(path = "hazel")
      if File.exists? path
        puts "#{path} already exists. Exiting."
      else
        app_files = File.expand_path('../../../app', __FILE__)
        
        Hazel::CLI.source_root(app_files)
        
        directory(app_files, path)
      end
    end
    
    desc :version, "The current version number (#{VERSION::STRING})"
    def version
      puts VERSION::STRING
    end
  end
end