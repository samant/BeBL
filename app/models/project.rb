class Project < ActiveRecord::Base
  
  has_many :managements, :dependent => :destroy, :autosave => true, :inverse_of => :project
  has_many :managers, :source => :user , :through => :managements
  accepts_nested_attributes_for :managements
  
  has_many :developments, :dependent => :destroy,:autosave => true, :inverse_of => :project
  has_many :developers, :source => :user , :through => :developments
  accepts_nested_attributes_for :developments
  
  has_many :utilisations, :dependent => :destroy,:autosave => true, :inverse_of => :project
  has_many :components, :through => :utilisations
  
  has_many :classifications, :as => :classificable, :dependent => :destroy, :inverse_of => :classificable, :autosave => true
  has_many :categories, :through => :classifications
  
  has_many :attachments, :dependent => :destroy, :inverse_of => :project, :autosave => true
  accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank
  
  validates :name, :presence => true, :uniqueness => true
  
  attr_accessible :name, :description, :manager_ids, :developer_ids, :category_ids, :component_ids, :attachments_attributes,
                  :client_name, :estimated_duration, :real_duration,:github_address, :staging_address, :staging_account,
                  :staging_password, :production_address,:production_account, :production_password
  
  def contains_manager?(user)
    managers.include? user
  end
  
  def contains_developer?(user)
    developers.include? user
  end
  
end