class AssignedTask < ActiveRecord::Base
  belongs_to :kid
  belongs_to :task
end
