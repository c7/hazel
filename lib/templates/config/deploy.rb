<% if @rvm_gemset -%>
require "rvm/capistrano"

set :rvm_ruby_string, "ruby-2.1.0"
set :rvm_type, :system

<% end -%>
require "bundler/capistrano"
require "capistrano/ext/multistage"

#############################################################
# Stages
#############################################################

set :default_stage, "production"
set :stages, %w(production)

#############################################################
# Application
#############################################################

set :application, "<%= @name %>"
set :deploy_to, "/var/www/apps/#{application}"
set :keep_releases, 2

after "deploy:update", "deploy:cleanup"

#############################################################
# Settings
#############################################################

set :user, "deploy"
set :use_sudo, false

ssh_options[:forward_agent] = true

#############################################################
# Git
#############################################################

set :scm, :git
set :deploy_via, :remote_cache

set :repository, "git@github.com:/GITHUB_USER/#{application}.git"

namespace :deploy do
  task :set_branch do
    set(:branch) { Capistrano::CLI.ui.ask("Branch to deploy (or press ENTER to deploy from master): ") }

    if branch.empty?
      set :branch, "master"
    end
  end

  before "deploy:update" , "deploy:set_branch"
end

<% if @rvm_gemset -%>
#############################################################
# RVM
#############################################################

after "deploy", "rvm:trust_rvmrc"

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{current_release}"
    run "rvm rvmrc trust /var/www/apps/#{application}/current"
  end
end

<% end -%>
#############################################################
# Passenger
#############################################################

namespace :deploy do
  task :start do
  end

  task :stop do
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
