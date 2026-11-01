# frozen_string_literal: true

Hanami.app.register_provider :tika do
  start do
    require "tika/parser"
    register :tika, Tika::Parser.new
  end
end
