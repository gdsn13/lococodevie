module Locomotive
  module Liquid
    module Drops
      class Content < Base

        delegate :seo_title, :meta_keywords, :meta_description, :to => '_source'

        def _id
          self._source._id.to_s
        end
        
        # Returns the next content for the parent content type.
        # If no content is found, nil is returned.
        #
        # Usage:
        #
        # {% if article.next %}
        # <a href="/articles/{{ article.next._permalink }}">Read next article</a>
        # {% endif %}
        #
        def next
          self._source.next.to_liquid
        end
        
        def random_produit
          produits = []
          self._source.produits.shuffle.each do |p|
            produits << p.to_liquid
          end
          produits
        end
        
        # Returns the previous content for the parent content type.
        # If no content is found, nil is returned.
        #
        # Usage:
        #
        # {% if article.previous %}
        # <a href="/articles/{{ article.previous._permalink }}">Read previous article</a>
        # {% endif %}
        #
        def previous
          self._source.previous.to_liquid
        end
        
        def get_products_for_rubrique
          produits = []
          products = ContentType.where(:slug => "produits").first
          products.ordered_contents.each do |pdt|
            pdt.rubriques.each do |pdt_rub|
              if pdt_rub._slug == self._source._slug
                produits << pdt.to_liquid
              end
            end
          end
          produits
        end
        
        def get_products_for_categorie
          produits = []
          products = ContentType.where(:slug => "produits").first
          products.ordered_contents.each do |pdt|
            pdt.categories.each do |pdt_rub|
              if pdt_rub._slug == self._source._slug
                produits << pdt.to_liquid
              end
            end
          end
          produits
        end
        
        def random_produit_for_categorie
          produits = []
          products = ContentType.where(:slug => "produits").first
          products.ordered_contents.each do |pdt|
            pdt.categories.each do |pdt_rub|
              if pdt_rub._slug == self._source._slug
                produits << pdt.to_liquid
              end
            end
          end
          produits.shuffle
        end

        def before_method(meth)
          
          return '' if self._source.nil?

          if not @@forbidden_attributes.include?(meth.to_s)
            value = self._source.send(meth)
          end
        end

        def highlighted_field_value
          self._source.highlighted_field_value
        end
        
        def galerie_thumb
          self._source.pic.thumbz.url
        end
        
      end
    end
  end
end
