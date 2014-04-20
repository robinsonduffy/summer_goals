class Kid < ActiveRecord::Base
  has_many :completed_tasks
  has_and_belongs_to_many :tasks
  
  attr_accessible :name, :points, :task_ids
  
  validates :name, :presence => true, 
                    :uniqueness => {:case_sensitve => false}
                    
  validates :points, :numericality => true
  
end
