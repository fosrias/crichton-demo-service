require 'crichton/representor'
require 'drds_extensions'

class DrdDecorator < BaseDecorator
  include DrdsExtensions
  include Crichton::Representor::State

  decorates :drd
  represents :drd
  state_method :status
end
