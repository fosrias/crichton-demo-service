require 'spec_helper'
require 'crichton/lint'

describe 'DRDs resource descriptor' do
  let(:validator) { Crichton::Lint }
  #   For users of the Crichton gem, change to this line and update <my descriptor_file>
  #   let(:filename) { File.join(Crichton.descriptor_location, <my descriptor file>) }
  #
  let(:filename) { File.join('api_descriptors', 'drds_descriptor_v1.yml') }

  # Lint reports information to stdout. Add the following method if you do not want to see Lint output
  before do
    $stdout.stub(:write)
  end

  it 'exists' do
    File.exists?(filename).should be_true
  end

  it 'contains no errors' do
    Crichton::ExternalDocumentStore.any_instance.stub(:get).and_return('<alps></alps>')
     validator.validate(filename, {count: :error}).should == 0
  end

  it 'contains (14) warnings' do
    Crichton::ExternalDocumentStore.any_instance.stub(:get).and_return('<alps></alps>')
    validator.validate(filename, {count: :warning}).should == 14
  end

  it 'passes validation with the --strict option' do
    Crichton::ExternalDocumentStore.any_instance.stub(:get).and_return('<alps></alps>')
    result = validator.validate(filename, {strict: true})
    result.should be_true
  end
end
