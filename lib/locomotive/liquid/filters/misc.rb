module Locomotive
  module Liquid
    module Filters
      module Misc

        def underscore(input)
          input.to_s.gsub(' ', '_').gsub('/', '_').underscore
        end

        def dasherize(input)
          input.to_s.gsub(' ', '-').gsub('/', '-').dasherize
        end

        def concat(input, *args)
          result = input.to_s
          args.flatten.each { |a| result << a.to_s }
          result
        end

        # was called modulo at first
        def str_modulo(word, index, modulo)
          (index.to_i + 1) % modulo == 0 ? word : ''
        end

        def modulo(index, modulo)
          index.to_i % modulo.to_i
        end

        def split(input, pattern)
          input.to_s.split(pattern)
        end

        def xletters(input, number)
          input.to_s[0, number]
        end

        def xLastLetters(input, number)
          input.to_s.split(//).last(number).join("").to_s
        end

        def kilo(input)
          (input.to_i / 1000).to_s.split('.').first.to_s
        end

      end

      ::Liquid::Template.register_filter(Misc)

    end
  end
end
