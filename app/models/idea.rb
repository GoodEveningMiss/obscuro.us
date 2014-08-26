class Idea < ActiveRecord::Base
  belongs_to :list, :inverse_of => :ideas
  
end
