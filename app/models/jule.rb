class Jule
  include Locomotive::Mongoid::Document
  
  field :name
  field :block
  field :url
  
  mount_uploader :picto, JuleUploader
  
  scope :latest_updated, :order_by => [[:updated_at, :desc]]
  
  validates_presence_of :name
  
  referenced_in :site
  
  def self.for_menu
    order_by([[:updated_at, :desc]]).limit(10)
  end
  
  def to_liquid
    { :picto_url => self.picto.url }.merge(self.attributes).stringify_keys
  end
end