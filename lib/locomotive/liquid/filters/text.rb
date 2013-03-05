module Locomotive
  module Liquid
    module Filters
      module Text

        def textile(input)
          ::RedCloth.new(input).to_html
        end
        
        def html_for_json(input)
          result = input.to_s.gsub('/', '\/')
          input.html_safe? ? r = result.html_safe : r = result
          r.to_json.html_safe
        end

      end

      ::Liquid::Template.register_filter(Text)

    end
  end
end
