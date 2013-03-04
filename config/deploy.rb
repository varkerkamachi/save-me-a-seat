require 'rvm/capistrano'
require 'capistrano/ext/multistage'

set :rvm_type,              :user
set :rvm_ruby,              "ruby-1.9.3-p327"
set :rvm_gemset,            "global"
set :rvm_gem_home,          "/home/deploy/.rvm/gems/#{fetch(:rvm_ruby)}@#{fetch(:rvm_gemset)}"
set :rvm_ruby_path,         "/home/deploy/.rvm/rubies/#{fetch(:rvm_ruby)}"

set :application, "savemeaseat"
set :repository,  "git@github.com:varkerkamachi/save-me-a-seat.git"

set :scm,                   :git
set :branch,                "master"
ssh_options[:forward_agent] = true

set :deploy_to,             "/var/www/save-me-a-seat"

server "measeat.com",      :app, :web, :db, :primary => true
set :user,                  "deploy"

set :copy_exclude,          [".DS_Store", "*~"]
set :use_sudo,              false

set :stages, ["staging", "production"]
set :default_stage, "production"

