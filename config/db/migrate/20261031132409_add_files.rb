# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :files do
      primary_key :id
      column :filename, :text, null: false
      column :internal_filename, :string, null: false
      column :size, :integer, null: false
    end
  end
end
