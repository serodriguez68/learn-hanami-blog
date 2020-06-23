# frozen_string_literal: true

Hanami.application.routes do
  slice :main, at: "/" do
    root to: "home.show"
  end

  slice :admin, at: "/admin" do
    # Articles
    get  "articles", to: "articles.index"
    get  "articles/new", to: "articles.new"
    post "articles", to: "articles.create"
    get  'articles/:id/edit', to: 'articles.edit'
    post 'articles/:id/update', to: 'articles.update'
  end
end
