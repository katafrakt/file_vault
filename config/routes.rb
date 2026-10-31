# frozen_string_literal: true

module FileVault
  class Routes < Hanami::Routes
    post "/upload", to: "files.upload"
    get "/", to: "files.list"
  end
end
