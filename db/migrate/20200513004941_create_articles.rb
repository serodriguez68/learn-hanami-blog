# frozen_string_literal: true

# HINT: check out Sequel Migrations docs

ROM::SQL.migration do
  change do
    create_table :articles do
      primary_key :id
      column :title, :text, null: false
      column :slug, :text, null: false, unique: true
    end
  end
end
