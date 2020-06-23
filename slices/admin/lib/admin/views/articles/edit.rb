require "admin/view/base"
require 'admin/views/articles/shared/expose_attributes_with_errors'

module Admin
  module Views
    module Articles
      class Edit < View::Base
        config.template = "articles/edit"
        include Admin::Views::Articles::Shared::ExposeAttributesWithErrors
      end
    end
  end
end

