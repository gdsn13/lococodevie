module Locomotive
  module Search

    class Search
      attr_reader :title, :type, :permalink
      
      def initialize(p_title, p_type, p_permalink)
        :title = p_title
        :type = p_type
        :permalink = p_permalink
      end
      
      
    end

 end

end