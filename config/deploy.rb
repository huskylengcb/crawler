require 'mina/rails'
require 'mina/git'
require 'mina/rvm'    # for rvm support. (https://rvm.io)
require 'mina/bundler'
require 'mina/puma'

set :domain, 'root@116.62.162.141'
set :deploy_to, '/var/www/crawler_demo'
set :branch, 'master'

set :application_name, 'crawler_demo'
set :repository, 'git@github.com:huskylengcb/crawler_demo.git'

set :rvm_use_path, '/usr/local/rvm/scripts/rvm'
set :shared_dirs, ['public/uploads', 'log', 'tmp/pids', 'tmp/sockets', 'public/images', 'vendor/bundle']
set :shared_files, ['config/database.yml', 'config/master.key', 'config/puma.rb']

task :environment do
  invoke :'rvm:use', '2.4.1'
end

task :setup do #发布的目录结构
  command %[mkdir -p "#{fetch(:shared_path)}/log"]

  command %[mkdir -p "#{fetch(:shared_path)}/tmp/pids"]
  command %[mkdir -p "#{fetch(:shared_path)}/tmp/sockets"]
  command %[mkdir -p "#{fetch(:shared_path)}/vendor/bundle"]

  # 在服务器项目目录的shared中创建config文件夹 下同
  command %[mkdir -p "#{fetch(:shared_path)}/config"]
  command %[mkdir -p "#{fetch(:shared_path)}/config/settings"]

  command %[mkdir -p "#{fetch(:shared_path)}/public/uploads"]
  command %[mkdir -p "#{fetch(:shared_path)}/public/images"]

  command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  command %[touch "#{fetch(:shared_path)}/config/settings/production.local.yml"]

  #存放公众号secret的文件夹
  command  %[echo "-----> Be sure to edit '#{fetch(:shared_path)}/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy do #发布
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'rvm:use', '2.4.1'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'puma:restart'
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

desc "Start Puma."
task :puma_start => :environment do
  # invoke :'puma:start'
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
