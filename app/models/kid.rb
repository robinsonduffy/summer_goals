class Kid < ActiveRecord::Base
  has_many :completed_tasks
  has_many :assigned_tasks
  has_many :tasks, through: :assigned_tasks
  
  attr_accessible :name
  
  validates :name, :presence => true, 
                    :uniqueness => {:case_sensitve => false}
  
  def get_goal_for_task(task_id)
    task = Task.find(task_id)
    self.assigned_tasks.each do |assigned_task|
      return assigned_task.goal if assigned_task.task.eql?task
    end
    return nil
  end
  
  def get_progress_for_task(task_id)
    needed = self.get_goal_for_task(task_id)
    completed = self.completed_tasks.where(:task_id => task_id).size
    completed = needed if completed > needed
    return ((completed.to_f / needed) * 100).to_i
  end
  
  
end
