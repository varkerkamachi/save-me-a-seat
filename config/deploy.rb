#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.    
require "rvm/capistrano"
require 'capistrano/ext/multistage'

set :rvm_ruby_string, 'ruby-1.9.3-p327'
set :rvm_type, :user  # Don't use system-wide RVM

set :default_stage, "production"

task :production do
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

  #set :rails_env, 'production'
  #set :stages, ["staging", "production"]
  #set :default_stage, "production"


  set :rvm_type, :user
  set :rvm_ruby, "ruby-1.9.2-p180"
  set :rvm_gemset, "global"
  set :rvm_gem_home, "/home/deploy/.rvm/gems/#{fetch(:rvm_ruby)}@#{fetch(:rvm_gemset)}"
  set :rvm_ruby_path, "/home/deploy/.rvm/rubies/#{fetch(:rvm_ruby)}"
  # set :default_environment, {
  # 'PATH' => "#{fetch(:rvm_gem_home)}/bin:/home/deploy/.rvm/bin:#{fetch(:rvm_ruby_path)}/bin:$PATH;",
  # 'RUBY_VERSION' => "#{fetch(:rvm_ruby)}",
  # 'GEM_HOME' => "#{fetch(:rvm_gem_home)}",
  # 'GEM_PATH' => "#{fetch(:rvm_gem_home)}",
  # 'BUNDLE_PATH' => "#{fetch(:rvm_gem_home)}"
  # }
end