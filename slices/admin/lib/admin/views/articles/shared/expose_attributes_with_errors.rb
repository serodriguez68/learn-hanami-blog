module Admin
  module Views
    module Articles
      module Shared
        module ExposeAttributesWithErrors
          def self.included(klass)
            klass.expose(:attrs) { |attrs: {}| attrs }

            # If we wanted something more sophisticated that encapsulates both
            # article attributes together with their errors, we would need to create
            # a new abstraction for a form object in charge of carrying attributes and errors
            klass.expose(:errors) { |errors: {}| errors }
          end
        end
      end
    end
  end
end
