# class Task
#   attr_accessor :title, :date

#   def self.all
#     [Task.alloc.initWithTitle("Something"), Task.alloc.initWithTitle("Different")]
#   end

#   def initWithDefaults title
#     self.title = title||"Some Title" if init
#     self.date = Time.now
#     self
#   end

#   alias :initWithTitle :initWithDefaults
# end

class Task
  include MotionModel::Model

  columns title: :string, date: :date
end
