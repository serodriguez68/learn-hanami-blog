require "admin/view/base"

module Admin
  module Views
    module Articles
      class New < View::Base
        config.template = "articles/new"

        expose(:attrs) do |attrs: {}|
          attrs
        end

        # If we wanted something more sophisticated that encapsulates both
        # article attributes together with their errors, we would need to create
        # a new abstraction for a form object in charge of carrying attributes and errors
        expose :errors do |errors: {}|
          errors
        end
      end
    end
  end
end
