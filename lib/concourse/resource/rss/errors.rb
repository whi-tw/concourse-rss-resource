# frozen_string_literal: true
module Concourse
  module Resource
    module RSS
      class InvalidFeed < StandardError
        def initialize(url)
          super("Could not parse contents of #{url}")
        end
      end

      class VersionUnavailable < StandardError
        def initialize(version, source)
          super("There is no version matching #{version} available at the source #{source}")
        end
      end
    end
  end
end
