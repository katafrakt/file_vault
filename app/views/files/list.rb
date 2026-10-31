# frozen_string_literal: true

module FileVault
  module Views
    module Files
      class List < FileVault::View
        include Deps["repos.file_repo"]

        expose :files do
          file_repo.all
        end
      end
    end
  end
end
