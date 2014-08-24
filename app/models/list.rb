require 'digest'
class List < ActiveRecord::Base
  before_create :set_unique_url
  
  belongs_to :user
  has_many :ideas
  
  
  private
  def set_unique_url
    self.url = Digest::SHA256.hexdigest(Time.now.to_r.to_s + self.list_id.to_s)
  end
end
