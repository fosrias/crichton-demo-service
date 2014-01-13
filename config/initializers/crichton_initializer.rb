require 'bundler/cli'
require 'crichton'

gem = Bundler.load.specs.find{ |g| g.name == 'crichton' }
crichton_drd_doc = "#{gem.full_gem_path}/spec/fixtures/resource_descriptors/drds_descriptor_v1.yml"
Crichton.initialize_registry(crichton_drd_doc)
