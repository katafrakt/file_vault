# frozen_string_literal: true

module FileVault
  module Repos
    class FileRepo < FileVault::DB::Repo
      EXTRACTED_KEYS = %i[title author description pages image_width image_height].freeze

      def create(attacher)
        metadata = attacher.data["metadata"]

        files.command(:create).call(
          filename: metadata["filename"],
          size: metadata["size"],
          internal_filename: attacher.data["id"]
        )
      end

      def add_extracted_data(record, extracted)
        data = extracted.slice(*EXTRACTED_KEYS).merge(extracted_text: extracted[:text])
        files.by_pk(record.id).changeset(:update, data).commit
      end

      def search(term, fulltext: false)
        pattern = "%#{term.gsub(/[\\%_]/) { |char| "\\#{char}" }}%"
        files.where {
          match = filename.ilike(pattern) | title.ilike(pattern) | author.ilike(pattern)
          match |= extracted_text.ilike(pattern) if fulltext
          match
        }.to_a
      end

      def all
        files.to_a
      end
    end
  end
end













