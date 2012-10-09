class TaskListViewController < UITableViewController
  extend IB

  outlet :task_name, UILabel
  outlet_collection :task_names, UILabel

  def viewDidLoad
    super

    @data = ("A".."Z").to_a
    task_names = @data
    task_name.text = "Title"
  end

  # def tableView(tableView, numberOfRowsInSection: section)
  #   @data.count
  # end

  # def tableView(tableView, cellForRowAtIndexPath: indexPath)
  #   @reuseIdentifier ||= "TASK_IDENTIFIER"

  #   cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
  #     UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
  #   end

  #   cell
  # end
end