require "admin/repository"

module Admin
  class ArticleRepo < Repository[:articles]
    # commands update: :by_pk

    def listing
      articles.to_a
    end

    def create(attrs)
      slug = generate_slug_from_title(attrs[:title])
      articles.changeset(:create, **attrs, slug: slug).commit
    end

    def update(id, attrs)
      articles.by_pk(id).changeset(:update, attrs).commit
      # super(id, attrs) # alternative using command (no need to declare it explictly)
    end

    private

    def generate_slug_from_title(title)
      title.downcase.gsub(/\s+/, '-')
    end
  end
end
