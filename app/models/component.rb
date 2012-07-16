class Component < ActiveRecord::Base
  
  TYPE = { "Gem" => "gem", "API" => "api", "Javascript" => "js", "CSS" => "css" ,"Other" => "other"}
  
  has_many :classifications, :as => :classificable, :dependent => :destroy, :inverse_of => :classificable, :autosave => true
  has_many :categories, :through => :classifications
  
  has_many :utilisations, :autosave => true, :dependent => :destroy, :inverse_of => :component
  has_many :projects, :through => :utilisations
  
  validates :name, :presence => true, :uniqueness => true
  validates :ctype, :presence => true, :inclusion => { :in => TYPE.values }
  
  attr_accessible :name, :ctype, :description, :category_ids
  
  scope :by_type, lambda{ |ctype| (ctype.nil? || ctype == "all") ? where(:ctype => TYPE.values ) : where(:ctype => ctype)  }
  
  def usage
    (Project.all.count > 0) ? (BigDecimal.new(projects.count.to_s) / BigDecimal.new(Project.all.count.to_s) * 100) : 0
  end
  
  def users
    people = User.joins(:developed_projects => :components).where("components.id = ?", self)
    res = people.uniq.inject({}) {|acc, user| acc.merge!({user => (people.where(:id => user).count) })}
    res.sort{ |a,b| -b[1]<=>a[1] }
  end
  
  def total_usage
    projects.count
  end
  
  def self.total_usage_by_type(type)
    self.by_type(type).joins(:projects).count
  end
  
  def self.usage_by_type(type)
    Component.by_type(type).joins(:projects).group("components.id").count.sort{ |a,b| -b[1]<=>a[1] }
  end
  
end