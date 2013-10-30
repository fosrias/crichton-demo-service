desc 'Sets up the application'
task :setup => :environment do
  Rake::Task['db:drop'].invoke rescue nil
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
  Rake::Task['db:seed'].invoke
  Rake::Task['config:deploy'].invoke
  Rake::Task['update_drd'].invoke
end
