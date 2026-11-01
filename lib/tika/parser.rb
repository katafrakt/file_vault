# frozen_string_literal: true

require "java"
Dir[File.expand_path("../../vendor/jars/*.jar", __dir__)].sort.each { |jar| require jar }

module Tika
  java_import "org.apache.tika.parser.AutoDetectParser"
  java_import "org.apache.tika.metadata.Metadata"
  java_import "org.apache.tika.metadata.TikaCoreProperties"
  java_import "org.apache.tika.sax.BodyContentHandler"
  java_import "org.apache.tika.parser.ParseContext"
  java_import "org.apache.tika.parser.ocr.TesseractOCRConfig"
  java_import "org.apache.tika.io.TikaInputStream"

  class Parser
    TITLE_KEYS = ["dc:title"].freeze
    AUTHOR_KEYS = ["dc:creator", "meta:last-author", "Author"].freeze
    DESCRIPTION_KEYS = ["dc:description", "dc:subject", "Description", "Subject"].freeze
    PAGES_KEYS = ["xmpTPg:NPages", "meta:page-count", "pdf:pageCount"].freeze
    WIDTH_KEYS = ["tiff:ImageWidth", "width", "Image Width"].freeze
    HEIGHT_KEYS = ["tiff:ImageLength", "height", "Image Height"].freeze

    def extract(path)
      parser = AutoDetectParser.new
      handler = BodyContentHandler.new(-1)
      metadata = Metadata.new
      context = ParseContext.new

      # we don't need OCR
      ocr_config = TesseractOCRConfig.new
      ocr_config.setSkipOcr(true)
      context.set(TesseractOCRConfig.java_class, ocr_config)

      stream = TikaInputStream.get(java.nio.file.Paths.get(path.to_s))
      begin
        parser.parse(stream, handler, metadata, context)
      rescue
        # unparsable file
        # probably should log
      ensure
        stream.close
      end

      raw = metadata.names.map { |name| [name, metadata.get(name)] }.to_h

      {
        text: handler.to_s,
        metadata: raw,
        title: pick(raw, TITLE_KEYS),
        author: pick(raw, AUTHOR_KEYS),
        description: pick(raw, DESCRIPTION_KEYS),
        pages: pick_int(raw, PAGES_KEYS),
        image_width: pick_int(raw, WIDTH_KEYS),
        image_height: pick_int(raw, HEIGHT_KEYS)
      }
    end

    private

    def pick(metadata, keys)
      keys.each do |key|
        value = metadata[key].to_s.strip
        return value unless value.empty?
      end
      nil
    end

    # Values like "640 pixels" or "640" both yield 640
    def pick_int(metadata, keys)
      value = pick(metadata, keys)
      value&.match(/\d+/)&.[](0)&.to_i
    end
  end
end
