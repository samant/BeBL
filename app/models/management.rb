class Management < ActiveRecord::Base
  
  belongs_to :project, :inverse_of => :managements
  belongs_to :user, :inverse_of => :managements
end