# frozen_string_literal: true

module FileVault
  module Actions
    module Files
      class Upload < FileVault::Action
        include Deps["operations.upload_file"]

        def handle(request, response)
          attacher = Uploaders::FileUploader::Attacher.new
          attacher.assign(request.params[:file])

          upload_file.call(attacher)
          response.redirect("/")
        end
      end
    end
  end
end
