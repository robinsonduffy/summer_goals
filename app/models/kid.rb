class Kid < ActiveRecord::Base
  has_many :completed_tasks
  has_many :assigned_tasks
  has_many :tasks, through: :assigned_tasks
  
  attr_accessible :name, :points, :task_ids
  
  validates :name, :presence => true, 
                    :uniqueness => {:case_sensitve => false}
                    
  validates :points, :numericality => true
  
  def get_goal_for_task(task_id)
    task = Task.find(task_id)
    self.assigned_tasks.each do |assigned_task|
      return assigned_task.goal if assigned_task.task.eql?task
    end
    return nil
  end
  
  
end
