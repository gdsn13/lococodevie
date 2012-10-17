module Locomotive
  module Liquid
    module Drops
      class Search < Base
        
        delegate :title, :type, :permalink, :to => '_source'

        def title
          self._source.title
        end

      end
    end
  end
end
