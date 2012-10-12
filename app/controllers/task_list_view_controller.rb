class TaskListViewController < UITableViewController
  attr_accessor :tasks

  def viewDidLoad
    super

    self.tasks = Task.all
  end

  def tableView tableView, cellForRowAtIndexPath: indexPath
    @reuseIdentifier ||= "TaskCell"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)

    # if cell.nil?
      # cell = TaskListViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    # end

    # cell.setText NSString.stringWithFormat "I am cell #{indexPath.row}"

    task = tasks[indexPath.row]

    cell.textLabel.text = task.title
    cell.detailTextLabel.text = task.date.to_s

    cell
  end

  def tableView tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath
    if editingStyle == UITableViewCellEditingStyleDelete
      # delete task from array
      tasks.delete tasks[indexPath.row]

      # delete actual task in db
      selected_task = tasks[indexPath.row]
      Task.find {|task| task == selected_task}.delete
      Task.serialize_to_file 'tasks.dat'

      # delete row
      tableView.deleteRowsAtIndexPaths [indexPath], withRowAnimation:UITableViewRowAnimationFade

      # reload data from tasks
      tableView.reloadData

      puts "tasks = #{tasks}"
      self
    end
  end

  def tableView tableView, numberOfRowsInSection: section
    tasks.count
  end
end
