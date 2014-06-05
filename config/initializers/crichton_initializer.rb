require 'rake'
CrichtonDemoService::Application.load_tasks
Rake::Task['load:resource_descriptor'].invoke