require "admin/repository"

module Admin
  class ArticleRepo < Repository[:articles]
    def listing
      articles.to_a
    end
  end
end
