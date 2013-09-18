require 'crichton/descriptor/detail'
require 'crichton/representor'

module Crichton
  module Descriptor
    ##
    # Manages retrieving the transitions associated with transition descriptors from a target object.
    class TransitionDecorator < Detail
      
      alias :old_templated? :templated?
      
      def templated?
        old_templated? || !safe?
      end
    end
  end
end
