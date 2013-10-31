require 'bundler/cli'

desc 'Load resource descriptor document'
namespace :load do
  task :resource_descriptor => :environment do
    gem = Bundler.load.specs.find{ |g| g.name == 'crichton' }
    crichton_drd_doc = "#{gem.full_gem_path}/spec/fixtures/resource_descriptors/drds_descriptor_v1.yml"
    drd_doc = File.join(Dir.pwd, 'api_descriptors/drds_descriptor_v1.yml')
    if File.exists?(crichton_drd_doc)
      FileUtils.cp(crichton_drd_doc, drd_doc) unless FileUtils.identical?(crichton_drd_doc, drd_doc)
    end
  end  
end
