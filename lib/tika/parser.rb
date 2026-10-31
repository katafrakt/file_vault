module Tika
  class Parser
    def initialize
      Hanami.app["tika"]
    end

    def extract(path)
      parser   = AutoDetectParser.new
      handler  = BodyContentHandler.new(-1)   # -1 = no write limit
      metadata = Metadata.new
      stream   = TikaInputStream.get(java.nio.file.Paths.get(path.to_s))
      begin
        parser.parse(stream, handler, metadata, ParseContext.new)
      ensure
        stream.close
      end
      {
        text: handler.to_s,
        metadata: metadata.names.map { |n| [n, metadata.get(n)] }.to_h
      }
    end
  end
end
