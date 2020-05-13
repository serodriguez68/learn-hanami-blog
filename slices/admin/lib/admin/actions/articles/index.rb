require "admin/action"

module Admin
  module Actions
    module Articles
      class Index < Admin::Action
        include Deps[view: "views.articles.index"]

        def handle(req, res)
          render req, res
        end
      end
    end
  end
end
