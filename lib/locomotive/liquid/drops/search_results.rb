module Locomotive
  module Liquid
    module Drops
      class SearchResult < ::Liquid::Drop

        def results 
          @context.registers[:search_result]
        end
        
        def query
          @context.registers[:query_string]
        end
        
      end
    end
  end
end