# frozen_string_literal: true

module FileVault
  module Repos
    class FileRepo < FileVault::DB::Repo
      def create(attacher, extracted = {})
        metadata = attacher.data["metadata"]

        files.command(:create).call(
          filename: metadata["filename"],
          size: metadata["size"],
          internal_filename: attacher.data["id"],
          title: extracted[:title],
          author: extracted[:author],
          description: extracted[:description],
          pages: extracted[:pages],
          image_width: extracted[:image_width],
          image_height: extracted[:image_height]
        )
      end

      def all
        files.to_a
      end
    end
  end
end
