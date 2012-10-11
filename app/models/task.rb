class Task
  attr_accessor :title, :date

  def self.all
    [Task.alloc.initWithDefaults, Task.alloc.initWithDefaults]
  end

  def initWithDefaults
    self.title = "Some Title" if init
    self.date = Time.now
    self
  end
end