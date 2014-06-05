require 'crichton'

namespace :load do
  desc 'Load the most recent resource descriptor document from crichton fixtures directory.'
  task :resource_descriptor => :environment do
    gem = Bundler.load.specs.find{ |g| g.name == 'crichton' }
    sample_drd_doc = File.join(gem.full_gem_path, '/spec/fixtures/resource_descriptors/drds_descriptor_v1.yml')
    api_filename = File.join(Dir.pwd, Crichton.descriptor_directory, 'drds_sample_descriptor_v1.yml')
    FileUtils.cp(sample_drd_doc, api_filename) unless File.exists?(api_filename)
  end
end
