class Kid < ActiveRecord::Base
  has_many :completed_tasks
  has_and_belongs_to_many :tasks
  
  attr_accessible :name, :points, :task_ids
  
  validates :name, :presence => true, 
                    :uniqueness => {:case_sensitve => false}
                    
  validates :points, :numericality => true
  
  def all_required_tasks_completed_today
    completed_tasks = []
    self.completed_tasks.where(:date => Time.current.to_date).each do |completed_task|
      completed_tasks << Task.find(completed_task.task_id)
    end
    self.required_tasks.each do |required_task|
      return false unless completed_tasks.include? required_task
    end
    return true
  end
  
  def required_tasks
    required_tasks = []
    self.tasks.each do |task|
      required_tasks << task if task.required
    end
    return required_tasks
  end
  
end
