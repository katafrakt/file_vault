# frozen_string_literal: true

require "tika/parser"

module FileVault
  module Actions
    module Files
      class Upload < FileVault::Action
        include Deps["repos.file_repo"]

        def handle(request, response)
          attacher = Shrine::Attacher.new
          attacher.assign(request.params[:file])
          attacher.store
          attacher.finalize

          file_repo.create(attacher)

          p Tika::Parser.new.extract(Hanami.app.root.join("public/uploads", attacher.data["id"]))

          response.redirect("/")
        end
      end
    end
  end
end
