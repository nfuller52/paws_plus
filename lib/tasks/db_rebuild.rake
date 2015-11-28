namespace :db do
  desc "Rebuild the database"
  task :rebuild, [] => :environment do
    raise "Not allowed to run in production" if Rails.env.production?

    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:setup'].execute
  end
end
