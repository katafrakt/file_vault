# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :files do
      add_column :extracted_text, :text, null: true
    end
  end
end
