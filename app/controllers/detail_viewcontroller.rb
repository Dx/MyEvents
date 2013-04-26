class DetailViewController < UIViewController

  def setEvent(event)
    @event = event
  end

  def viewDidLoad

    self.view.backgroundColor = UIColor.whiteColor

    @event_name_label = UILabel.new
    @event_name_label.font = UIFont.systemFontOfSize(10)
    @event_name_label.text = @event.event_name
    @event_name_label.textAlignment = UITextAlignmentCenter 
    @event_name_label.textColor = UIColor.blackColor
    @event_name_label.backgroundColor = UIColor.clearColor
    @event_name_label.frame = [[20, 20], [150, 30]]
    self.view.addSubview(@event_name_label)
  end
end