# frozen_string_literal: true

module FileVault
  module Repos
    class FileRepo < FileVault::DB::Repo
      def create(attacher)
        metadata = attacher.data["metadata"]

        files.command(:create).call(
          filename: metadata["filename"],
          size: metadata["size"],
          internal_filename: attacher.data["id"]
        )
      end

      def all
        files.to_a
      end
    end
  end
end
