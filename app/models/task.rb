class Task < ActiveRecord::Base
  has_many :completed_tasks
  has_and_belongs_to_many :kids
  
  attr_accessible :name, :points, :image
  
  validates :name,  :presence => true, 
                    :uniqueness => {:case_sensitve => false}
                    
  validates :points,  :numericality => true,
                      :presence => true
                      
end
