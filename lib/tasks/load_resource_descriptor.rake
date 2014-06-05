require 'crichton'

namespace :load do
  desc 'Load the most recent resource descriptor document from crichton fixtures directory.'
  task :resource_descriptor => :environment do
    gem = Bundler.load.specs.find{ |g| g.name == 'crichton' }
    sample_drd_doc = File.join(gem.full_gem_path, '/spec/fixtures/resource_descriptors/drds_descriptor_v1.yml')
    api_directory = File.join(Dir.pwd, Crichton.descriptor_directory)
    FileUtils.cp(sample_drd_doc, api_directory) unless File.exists?(File.join(api_directory, 'drds_descriptor_v1.yml'))
  end
end
