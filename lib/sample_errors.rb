require 'crichton/tools/base_errors'

class Sample_errors < Crichton::Tools::BaseErrors
  include Crichton::Representor::State
  represents :sample_errors

  def initialize(data)
    super(data)
  end

  def describes_url
    controller.request.path
  end
end
