require 'dry/monads'

module Admin
  module Articles
    module Commands
      class UpdateArticle
        include Dry::Monads[:result, :do]
        include Deps['articles.article_contract', 'article_repo']

        def call(id:, article_params:)
          validation = yield article_contract.call(article_params)
          article = yield update_article(id, validation.to_h)
          Success(article)
        end

        private

        def update_article(id, attrs)
          article = article_repo.update(id: id, attrs: attrs)
          # TODO: Tim. Where does it make sense to handle not finding the article
          #   to update?
          #   It could be in the validation, but that is not something the user cannot act on.
          #   If we get to that state, you are probably tampering the html.
          if article
            Success(article)
          else
            Failure[:not_found, "Article with id #{id} does not exist"]
          end
        end
      end
    end
  end
end
