require 'uuid_base'

class Drd < UuidBase
  def activate
    self.status = 'activated'
    save
  end

  def deactivate
    self.status = 'deactivated'
    save
  end
end
