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
        
        def other_produit
          produits = []
          
          @context.registers[:search_result].each do |sr|
            if sr.type == "produits"
              content = ContentType.where(:slug => "produits").first.contents.where(:_slug => sr.permalink).first
                    
              if content != nil && content.ambiances != nil
                content.ambiances.produits.shuffle.each do |pr|
                  produits << pr.to_liquid
                end
              end
              break
            end
          end
          
          produits
        end
        
      end
    end
  end
end