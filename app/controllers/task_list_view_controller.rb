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
      tasks.delete tasks[indexPath.row]
      tableView.deleteRowsAtIndexPaths [indexPath], withRowAnimation:UITableViewRowAnimationFade
      tableView.reloadData

      puts "tasks = #{tasks}"
      self
    end
  end

  def tableView tableView, numberOfRowsInSection: section
    tasks.count
  end
end
