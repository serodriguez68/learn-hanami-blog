require 'admin/validation/contract'

module Admin
  module Articles
    class ArticleContract < Admin::Validation::Contract
      include Deps['article_repo','author_repo']

      # 1. Define the schema
      params do
        required(:title).filled(:string)
        required(:body).filled(:string)
        required(:author_id).value(:integer)
      end

      # TODO: Tim. Q1) Are there any re-usable "common" validation macros for things like length of a string,
      #   number must be greater / smaller than, etc.
      #
      # TODO: Tim. Q2) Imagine that for the Article#update action we wanted to reuse some (but not all) of the rules
      #   in this contract.  (e.g. the title and body rules should be the same, but we will not allow :author_id to be updated)
      #   How would you share them? (maybe an article macro?)
      #
      # TODO: Tim. Q3) What if we wanted to guarantee that all articles must be at least X chars long. How can I create
      #   a "BaseArticleContract" that contains those globally applicable rules that can be composed / inherited
      #   into all other *Article contracts without having to duplicated the code or remembering to use the macro?
      rule(:title) do
        min_length = 5
        key.failure("must be #{min_length} characters or larger") if value.length < min_length
      end

      rule(:body) do
        min_length = 50
        key.failure("must be #{min_length} characters or larger") if value.length < min_length
      end

      rule(:author_id) do
        key.failure("must be from an existing author") unless author_repo.author_exists?(id: value)
      end
    end
  end
end
