module Locomotive
  module Liquid
    module Drops
      class Search < Base
        
        delegate :title, :type, :permalink, :to => '_source'

        def title
          self._source.title
        end
        
        def other_produit
          produits = []
          content = ContentType.where(:slug => "produits").first.contents.where(:_slug => self._source.permalink).first
          
          content.categories.produits.shuffle.each do |pr|
            produits << pr.to_liquid
          end
          produits
        end

      end
    end
  end
end
