class Reward < ActiveRecord::Base
  
  attr_accessible :name, :points, :image
  
  validates :name,  :presence => true, 
                    :uniqueness => {:case_sensitve => false}
                    
  validates :points,  :numericality => true,
                      :presence => true
end
