require "admin/repository"

module Admin
  class AuthorRepo < Repository[:authors]
    def author_exists?(id:)
      authors.by_pk(id).exist?
    end
  end
end
