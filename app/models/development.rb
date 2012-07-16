class Development < ActiveRecord::Base
  
  belongs_to :project, :inverse_of => :developments
  belongs_to :user, :inverse_of => :developments
  
end