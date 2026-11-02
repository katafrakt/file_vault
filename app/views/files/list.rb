# frozen_string_literal: true

module FileVault
  module Views
    module Files
      class List < FileVault::View
        include Deps["repos.file_repo"]

        expose :files do |q: nil, fulltext: nil|
          if q.to_s.empty?
            file_repo.all
          else
            file_repo.search(q, fulltext: !fulltext.to_s.empty?)
          end
        end

        expose :q do |q: nil|
          q
        end

        expose :fulltext do |fulltext: nil|
          !fulltext.to_s.empty?
        end
      end
    end
  end
end
