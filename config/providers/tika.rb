# frozen_string_literal: true

Hanami.app.register_provider :tika do
  start do
    require 'java'
    Dir[File.join(Hanami.app.root, 'vendor/jars/*.jar')].sort.each { |j| require j }

    module Tika
      java_import 'org.apache.tika.parser.AutoDetectParser'
      java_import 'org.apache.tika.metadata.Metadata'
      java_import 'org.apache.tika.metadata.TikaCoreProperties'
      java_import 'org.apache.tika.sax.BodyContentHandler'
      java_import 'org.apache.tika.parser.ParseContext'
      java_import 'org.apache.tika.io.TikaInputStream'
    end

    register :tika, Tika
  end
end
