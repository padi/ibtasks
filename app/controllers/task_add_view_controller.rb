class TaskAddViewController < UIViewController
  extend IB

  def close
    dismissModalViewControllerAnimated true
  end

  #IBActions start from here
  def cancel sender
    close
  end

  def save sender
    Task.create title: 'something', date: Time.now
    close
  end
end