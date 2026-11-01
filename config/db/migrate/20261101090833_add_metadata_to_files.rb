# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :files do
      add_column :title, :text, null: true
      add_column :author, :text, null: true
      add_column :description, :text, null: true
      add_column :pages, :integer, null: true
      add_column :image_width, :integer, null: true
      add_column :image_height, :integer, null: true
    end
  end
end
