# encoding: UTF-8

require "rubygems"
require "extensions/string"
require "thor/group"

module Hazel
  class CLI < Thor::Group
    include Thor::Actions

    desc "Creates a new Sinatra application"
    argument :name, :type => :string, :desc => "The name of the new application"
    class_option :database, :aliases => "-d", :default => "sqlite", :desc => "The type of database to use"
    class_option :no_database, :type => :boolean, :desc => "Exclude all database configuration files"
    class_option :redis, :type => :boolean, :desc => "Include Redis configuration"
    class_option :no_bundle_install, :type => :boolean, :desc => "Don’t run bundle install after generating the app"

    # Creates instance variables from options passed to hazel.
    def setup
      @name = @app_path = name.file_name
      options.each do |key, value|
        instance_variable_set "@#{key.to_s}".to_sym, value
      end
    end

    def self.source_root
      File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "lib", "templates"))
    end

    # Create empty directories
    def create_empty_directories
      %w{config/initializers lib log tmp spec}.each do |dir|
        empty_directory File.join(@app_path, dir)
      end

      empty_directory File.join(@app_path, 'db/migrate') unless @no_database

      create_file File.join(@app_path, "lib", ".gitkeep")
    end

    def create_public_directory
      %w{public/stylesheets public/javascripts public/images}.each do |dir|
        directory dir, File.join(@app_path, dir)
      end
    end

    def create_view_directory
      directory "views", File.join(@app_path, "views")
    end

    def create_app
      template "app.rb", File.join(@app_path, "#{@name}.rb")
    end

    def create_app_spec
      template "spec/app_spec.rb", File.join(@app_path, "spec/#{@name}_spec.rb")
    end

    def create_spec_helper
      template "spec/spec_helper.rb", File.join(@app_path, "spec/spec_helper.rb")
    end

    def create_config
      template "config.ru", File.join(@app_path, "config.ru")
    end

    def create_gemfile
      template "Gemfile", File.join(@app_path, "Gemfile")
    end

    def create_rakefile
      copy_file "Rakefile", File.join(@app_path, "Rakefile")
    end

    def create_readme
      copy_file "README.md", File.join(@app_path, "README.md")
    end

    def create_db_config
      template("config/db.yml", File.join(@app_path, "config/db.yml")) unless @no_database
    end

    def create_database_initializer
      template("config/initializers/database.rb", File.join(@app_path, "config/initializers/database.rb")) unless @no_database
    end

    def create_redis_config
      copy_file("config/redis.yml", File.join(@app_path, "config/redis.yml")) if @redis
    end

    def create_redis_initializer
      template("config/initializers/redis.rb", File.join(@app_path, "config/initializers/redis.rb")) if @redis
    end


    def install_dependencies
      inside(@name) do
        run('bundle install') unless @no_bundle_install
      end
    end
  end
end
