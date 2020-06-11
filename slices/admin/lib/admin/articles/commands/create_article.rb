require 'dry/monads'

module Admin
  module Articles
    module Commands
      class CreateArticle
        include Dry::Monads[:result, :do]
        include Deps['articles.article_contract', 'article_repo']

        def call(params)
          validation = yield article_contract.call(params)
          article = yield save_article(validation.to_h)
          Success(article)
        end

        private

        def save_article(attrs)
          # Question for Tim: should stuff like "slug is not unique" validations happen?
          #   Consider that the slug is created on the changeset
          #   To do that on the contract would have to
          #   make a DB query at validation time
          #   ALTERNATIVELY, we would need to add the validation on the changeset?
          #   A similar question goes for valid author_id validation
          #  ANS:  It is perfectly fine for the contract to make db queries that are exposed by the repos.
          article = article_repo.create(attrs)
          Success(article)
        end
      end
    end
  end
end
