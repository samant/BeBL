class Classification < ActiveRecord::Base
  
  belongs_to :classificable, :polymorphic => true, :inverse_of => :classifications
  belongs_to :category, :inverse_of => :classifications
  
end