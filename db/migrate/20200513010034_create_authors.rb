# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :authors do
      primary_key :id
      column :name, :text, null: false
      column :slug, :text, null: false, unique: true
    end
  end
end
