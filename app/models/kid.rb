class Kid < ActiveRecord::Base
  has_many :completed_tasks
  
  attr_accessible :name, :points
  
  validates :name, :presence => true, 
                    :uniqueness => {:case_sensitve => false}
                    
  validates :points, :numericality => true
end
