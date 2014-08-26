require 'digest'
class List < ActiveRecord::Base
  before_create :set_unique_url
  
  belongs_to :user
  has_many :ideas, dependent: :destroy
  accepts_nested_attributes_for :ideas, :allow_destroy => true
  
  
  private
  def set_unique_url
    self.url = Digest::SHA256.hexdigest(Time.now.to_r.to_s + self.id.to_s)
  end
end
