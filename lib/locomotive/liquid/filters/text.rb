module Locomotive
  module Liquid
    module Filters
      module Text

        def textile(input)
          ::RedCloth.new(input).to_html
        end
        
        def html_for_json(input)
          f = input.to_json.html_safe.to_s.gsub('/', '\/').gsub("\r", "")
          f.html_safe? ? f.html_safe : f
        end

      end

      ::Liquid::Template.register_filter(Text)

    end
  end
end
