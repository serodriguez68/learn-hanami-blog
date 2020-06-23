require "admin/repository"

module Admin
  class ArticleRepo < Repository[:articles]


    def listing
      articles.combine(:author).to_a
    end

    def create(attrs)
      slug = generate_slug_from_title(attrs[:title])
      articles.changeset(:create, **attrs, slug: slug).commit
    end

    def [](id)
      articles.by_pk(id).one
    end

    # To update we can either use a pre-made command or declare one explicitly
    # commands update: :by_pk
    def update(id:, attrs:)
      articles.by_pk(id).changeset(:update, attrs).commit
      # super(id, attrs) # alternative using pre-made command
    end

    private

    def generate_slug_from_title(title)
      title.downcase.gsub(/\s+/, '-')
    end
  end
end
