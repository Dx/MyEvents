class SubEventsTableViewController < UITableViewController

  def setEvent(event)
    @event = event
  end

  def tableView(tableView, numberOfSectionsInTableView:section)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @event.sub_events.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    event = @event.sub_events[indexPath.row]
    EventCell.cellForEvent(event, inTableView:tableView)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    event = @event.sub_events[indexPath.row]
    if event.sub_events.any?
      detail_controller = DetailViewController.alloc.init
      detail_controller.setEvent(event)
      self.navigationController.pushViewController(detail_controller, animated: true)    
    else
      sub_event_controller = SubEventsTableViewController.alloc.init
      sub_event_controller.setEvent(event)
      self.navigationController.pushViewController(sub_event_controller, animated: true)    
    end

  end
end