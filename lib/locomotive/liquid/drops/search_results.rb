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
              products = ContentType.where(:slug => "produits").first.contents
              content = products.where(:_slug => sr.permalink).first
              amb = content.ambiances.first
                    
              if content != nil && content.ambiances != nil
                products.each do |pdt|
                  if pdt.ambiances.include?(amb)
                    produits << pdt.to_liquid
                  end
                end
              end
              break
            end
          end
          
          produits.shuffle
        end
        
      end
    end
  end
end