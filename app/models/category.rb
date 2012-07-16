class Category < ActiveRecord::Base
  
  has_many :classifications, :dependent => :destroy, :inverse_of => :category
  has_many :components, :through => :classifications, :source => :classificable, :source_type => "Component"
  has_many :projects, :through => :classifications, :source => :classificable, :source_type => "Project"
  
  TYPE = { "Final" => "final", "Technical" => "technical" }
  
  validates :name, :presence => true, :uniqueness => true
  validates :cattype, :presence => true, :inclusion => { :in => TYPE.values }
  
  attr_accessible :name, :cattype, :description
  
  scope :by_type, lambda{ |cattype| (cattype.nil? || cattype == "all") ? where(:cattype => TYPE.values ) : where(:cattype => cattype)  }

  def experience
    (Project.all.any? ) ? ((BigDecimal.new(projects.count.to_s) / BigDecimal.new(Project.all.count.to_s)) * 100) : 0
  end
  
  def total_component_usage
    components.joins(:projects).count
  end
  
  def components_usage_by_type(type)
    components.where(:ctype => type ).joins(:projects).group("components.id").count.sort{ |a,b| -b[1]<=>a[1] }
  end
  
  def total_component_usage_by_type(type)
    components.where(:ctype => type ).joins(:projects).count
  end
  
  def self.skills_for_type(type)
    categories = self.joins(:projects).where(:cattype => type)
    categories.uniq.inject({}) {|acc, cat| acc.merge!({cat => cat.projects.uniq })}
  end
  
  def self.total_skills_for_type(type)
    self.joins(:projects).where(:cattype => type).uniq.count
  end
  
  def masters
    users = User.joins(:developed_projects => :categories).where("categories.id = ?", self )
    users.uniq.inject({}) {|acc, user| acc.merge!({user => user.developed_projects.joins(:categories).where("categories.id = ?", self ).uniq })}
  end
  
  def total_masters
    projects.count
  end
  
end