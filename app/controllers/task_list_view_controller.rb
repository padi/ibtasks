class TaskListViewController < UITableViewController
  extend IB

  def tableView tableView, cellForRowAtIndexPath: indexPath
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    cell.setText NSString.stringWithFormat "I am cell #{indexPath.row}"

    cell
  end

  def tableView tableView, numberOfRowsInSection: section
    10
  end
end