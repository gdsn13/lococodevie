class SearchObject
  
  attr_accessor :title, :type, :permalink
  
  
  
  def to_liquid
    
    Locomotive::Liquid::Drops::Search.new(self)
  end
  
end