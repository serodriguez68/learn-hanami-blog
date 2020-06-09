require "admin/action"

module Admin
  module Actions
    module Articles
      class New < Admin::Action
        include Deps[view: 'views.articles.new']

        def handle(req, res)
          render req, res
        end
      end
    end
  end
end
