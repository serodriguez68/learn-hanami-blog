require 'admin/action'
require 'dry/monads'

module Admin
  module Actions
    module Articles
      class Update < Admin::Action
        include Dry::Monads[:result]
        include Deps['articles.commands.update_article', view: 'views.articles.edit']

        def handle(req, res)
          article_result = update_article.call(
            id: req.params[:id],
            article_params: req.params[:article]
          )
          case article_result
          in Success
            res.redirect_to '/admin/articles'
          in Failure(:validation, validation)
            attempted_attrs = validation.to_h.merge(id: req.params[:id])
            errors = validation.errors.to_h
            render req, res, attrs: attempted_attrs, errors: errors
          in Failure(:not_found, _message)
            halt 404
          end
        end
      end
    end
  end
end
