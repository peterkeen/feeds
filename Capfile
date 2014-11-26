require 'rubygems'
require 'capistrano-buildpack'

set :application, "feeds"
set :repository, "git@git.bugsplat.info:peter/feeds.git"
set :scm, :git
set :additional_domains, ['feeds.bugsplat.info']

role :web, "kodos.zrail.net"
set :buildpack_url, "git@git.bugsplat.info:peter/bugsplat-buildpack-ruby-simple"

set :user, "peter"
set :base_port, 7400
set :concurrency, "web=1,worker=1"
set :use_ssl, true
set :force_ssl, true

read_env 'prod'

load 'deploy'
