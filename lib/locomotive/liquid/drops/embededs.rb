module Locomotive
  module Liquid
    module Drops
      class Embeded < ::Liquid::Drop

        def before_method( p_type )
          @type = p_type
          EmbededCollection.new(@type)
        end
      
      end
      
      class EmbededCollection < ::Liquid::Drop

        def initialize(content_type)
          @type = content_type
        end
        
        def before_method( p_type )         
          p p_type
        end 
        
        def jules
          @context.registers[:page].embeded_items.get_jules(@context.registers[:page])
        end
        
        def actus
          @context.registers[:page].embeded_items.get_actus()
        end
        
        def get_embeded
          @context.registers[:page].embeded_items.get_of_type(@type)
        end
        
      end
    end
  end
end
    