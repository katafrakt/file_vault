# frozen_string_literal: true

Hanami.app.register_provider :tika do
  prepare do
    require "java"
    Dir[File.join(Hanami.app.root, "vendor/jars/*.jar")].sort.each { |j| require j }
  end

  start do
    require "tika/parser"
    register :tika, Tika::Parser.new
  end
end
