# frozen_string_literal: true

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

          response.redirect("/")
        end
      end
    end
  end
end
