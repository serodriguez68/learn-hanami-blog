require "admin/action"
require 'dry/monads'

module Admin
  module Actions
    module Articles
      class Edit < Admin::Action
        include Deps['article_repo', view: 'views.articles.edit']

        def handle(req, res)
          article = article_repo[req.params[:id]]
          halt 404 unless  article
          render req, res, attrs: article.to_h
        end
      end
    end
  end
end
