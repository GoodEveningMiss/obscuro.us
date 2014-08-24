class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin registered] #other good option: banned
  
  before_create :set_default_role
  
  has_many :lists

  private
  def set_default_role
    self.role = 'registered'
  end
end
