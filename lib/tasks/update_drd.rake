require 'bundler/cli'

desc 'update resource descriptor document'
task :update_drd => :environment do
  gem = Bundler.load.specs.find{ |g| g.name == 'crichton' }
  crichton_drd_doc = "#{gem.full_gem_path}/spec/fixtures/resource_descriptors/drds_descriptor_v1.yml"
  drd_doc = File.join(Dir.pwd, 'api_descriptors/drds_descriptor_v1.yml')
  if File.exists?(crichton_drd_doc)
    FileUtils.cp(crichton_drd_doc, drd_doc) unless FileUtils.identical?(crichton_drd_doc, drd_doc)
  end
end
