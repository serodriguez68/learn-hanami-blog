require "admin/action"
require 'dry/monads'

module Admin
  module Actions
    module Articles
      class Create < Admin::Action
        include Dry::Monads[:result]
        include Deps['articles.commands.create_article', view: 'views.articles.new']

        def handle(req, res)
          article_result = create_article.call(req.params[:article])
          case article_result
          in Success
            res.redirect_to '/admin/articles'
          in Failure(:validation, validation)
            attempted_attrs = validation.to_h
            errors = validation.errors.to_h
            render req, res, attrs: attempted_attrs, errors: errors
          end
          # # TODO: transfrom this to Dry::Matcher or pattern matching.
          # if article_result.success?
          #   res.redirect_to '/admin/articles'
          # else
          #   errors = article_result.failure.errors.to_h
          #   render req, res, article_params: article_result.failure.to_h, errors: errors
          # end
        end
      end
    end
  end
end
