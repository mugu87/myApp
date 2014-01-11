default_run_options[:pty] = true
require 'bundler/capistrano'
set :application, "myApp"
set :repository,  "/Users/ryanlinstrom/Benefit_Project/#{application}"
set :deploy_to, "/var/www/#{application}" #path to your app on the production server 

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"
set :deploy_via, :copy
set :shallow_clone, 1

set :domain, '162.242.154.235'
role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain                         # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

set :user, "rails" #this is the ubuntu user we created
set :password, "RatPac87" #rails's password
set :use_sudo, false

set :mysql_user, "rails" #this is the mysql user we created
set :mysql_password, "Wo74r2HE"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
