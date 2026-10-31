# frozen_string_literal: true

module FileVault
  module Relations
    class Files < FileVault::DB::Relation
      schema :files, infer: true
    end
  end
end
