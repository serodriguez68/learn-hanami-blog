require 'admin/validation/contract'

module Admin
  module Articles
    class ArticleContract < Admin::Validation::Contract
      # 1. Define the schema
      params do
        required(:title).filled(:string)
        required(:body).filled(:string)
        required(:author_id).value(:integer)
      end

      # 2. Define extra rules
      # Author must exist
      # title must have at least x chars
      # body must have at least x chars
    end
  end
end
