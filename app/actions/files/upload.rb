# frozen_string_literal: true

require "tika/parser"

module FileVault
  module Actions
    module Files
      class Upload < FileVault::Action
        include Deps["repos.file_repo", "uploader", "tika"]

        def handle(request, response)
          attacher = Shrine::Attacher.new
          attacher.assign(request.params[:file])
          attacher.store
          attacher.finalize

          stored_path = uploader.storages[:store].path(attacher.data["id"])
          extracted = tika.extract(stored_path)

          file_repo.create(attacher, extracted)

          response.redirect("/")
        end
      end
    end
  end
end
