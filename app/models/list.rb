require 'digest'
class List < ActiveRecord::Base
  before_create :set_unique_url
  
  belongs_to :user, :inverse_of => :lists
  has_many :ideas, dependent: :destroy, :inverse_of => :list
  accepts_nested_attributes_for :ideas, :allow_destroy => true
  
  validates_uniqueness_of :url
  
  def to_param
    self.url.parameterize
  end
  
  private
  def set_unique_url
    if self.url.blank?
      self.url = Digest::SHA256.hexdigest(Time.now.to_r.to_s + self.id.to_s)
    end
  end
end
