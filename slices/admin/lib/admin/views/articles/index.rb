require "admin/view/base"

module Admin
  module Views
    module Articles
      class Index < View::Base
        config.template = "articles/index"

        include Deps["article_repo"]

        expose :articles do
          article_repo.listing
        end
      end
    end
  end
end
