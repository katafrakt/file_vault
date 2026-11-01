# frozen_string_literal: true

module FileVault
  module Operations
    class UploadFile < FileVault::Operation
      include Deps["repos.file_repo", "uploader", "tika"]

      def call(attacher)
        stored_path = step store_file(attacher)
        record = step create_record(attacher)
        record = step extract_data(stored_path, record)

        Success(path: stored_path, record:)
      end

      private

      def store_file(attacher)
        attacher.finalize
        Success(uploader.storages[:store].path(attacher.data["id"]))
      end

      def create_record(attacher)
        Success(file_repo.create(attacher))
      end

      def extract_data(path, record)
        extracted = tika.extract(path)
        Success(file_repo.add_extracted_data(record, extracted))
      end
    end
  end
end
