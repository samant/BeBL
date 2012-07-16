class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role
  
  RLS = {"Admin" => "admin",  "Visitor" => "visitor"}
  
  validates :name, :presence => true
  validates :email, :presence => true
  validates :role, :presence => true, :inclusion => { :in => RLS.values }
    
  has_many :managements, :dependent => :destroy, :inverse_of => :user
  has_many :managed_projects, :source => :project , :through => :managements
  
  has_many :developments, :dependent => :destroy, :inverse_of => :user
  has_many :developed_projects, :source => :project , :through => :developments
  
  def role?(role)
    (self.role == role.to_s)
  end
  
  def component_usage(component)
    User.joins(:developed_projects => :components).where("components.id = ?", component).where(:id => self).count
  end
  
  def components_usage
    User.joins(:developed_projects => :components).where(:id => self).group("components.id").count.sort{ |a,b| -b[1]<=>a[1] }
  end
  
  def components_usage_by_type(component_type)
    User.joins(:developed_projects => :components).where("components.ctype = ?", component_type).where(:id => self).group("components.id").count.sort{ |a,b| -b[1]<=>a[1] }
  end
  
  def total_component_usage
    User.joins(:developed_projects => :components).where(:id => self).count
  end
  
  def total_component_usage_by_type(component_type)
    User.joins(:developed_projects => :components).where(:id => self).where("components.ctype = ?", component_type).count
  end
  
  def projects_for_component(component)
    developed_projects.joins(:components).where("components.id = ?", component)
  end
  
  def skills
    categories = Category.joins(:projects => :developers).where("users.id = ?", self)
    categories.uniq.inject({}) {|acc, cat| acc.merge!({cat => cat.projects.joins(:developers).where("users.id = ?", self).uniq })}
  end
  
  def total_skills
    categories = Category.joins(:projects => :developers).where("users.id = ?", self).uniq.count
  end
  
end
