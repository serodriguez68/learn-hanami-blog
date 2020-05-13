# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :articles do
      add_foreign_key :author_id, :authors, null: false, on_delete: :cascade
    end
  end
end
