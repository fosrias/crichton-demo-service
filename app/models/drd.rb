require 'uuid_base'

class Drd < UuidBase
  include Crichton::Representor::State
  represents :drd
  state_method :status
  
  def activate
    self.status = 'activated'
    save
  end

  def deactivate
    self.status = 'deactivated'
    save
  end

  def status_options(options_structure = {})
    if kind == 'standard'
      options_structure = options_structure.dup
      options_structure.delete('hash')
      options_structure['list'] = ['option1', 'option4']
    end
    options_structure
  end

end
