class Idea < ActiveRecord::Base
  belongs_to :list, :inverse_of => :ideas
  acts_as_voteable  
end
