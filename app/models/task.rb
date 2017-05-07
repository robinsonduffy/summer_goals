class Task < ActiveRecord::Base
  has_many :completed_tasks
  has_many :assigned_tasks
  
  attr_accessible :name, :image
  
  validates :name,  :presence => true, 
                    :uniqueness => {:case_sensitve => false}
                      
end
