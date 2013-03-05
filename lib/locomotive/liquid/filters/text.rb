module Locomotive
  module Liquid
    module Filters
      module Text

        def textile(input)
          ::RedCloth.new(input).to_html
        end
        
        def html_for_json(input)
          input.to_json.html_safe.gsub("\r", "")
        end

      end

      ::Liquid::Template.register_filter(Text)

    end
  end
end
