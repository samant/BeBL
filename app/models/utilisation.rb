class Utilisation < ActiveRecord::Base
  
  belongs_to :component, :inverse_of => :utilisations
  belongs_to :project, :inverse_of => :utilisations
  
end