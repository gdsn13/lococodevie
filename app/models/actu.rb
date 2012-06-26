class Actu
  include Locomotive::Mongoid::Document
  
  field :title
  field :block
  
  mount_uploader :picto, ActuUploader
  
  scope :latest_updated, :order_by => [[:updated_at, :desc]]
  
  referenced_in :site
  
  validates_presence_of :title
  
  def self.for_menu
    order_by([[:updated_at, :desc]]).limit(10)
  end
  
  def to_liquid
    self.attributes.stringify_keys
  end
end