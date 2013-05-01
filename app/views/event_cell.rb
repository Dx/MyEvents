class EventCell < UITableViewCell
  CellID = 'CellIdentifier'
  MessageFontSize = 10

  def self.cellForEvent(event, inTableView:tableView)
  	p event.event_name
    cell = tableView.dequeueReusableCellWithIdentifier(EventCell::CellID) || EventCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
    cell.fill_with_event(event, inTableView:tableView)
    cell
  end

  def fill_with_event(event, inTableView:tableView)
    lineView = UIView.alloc.initWithFrame(CGRectMake(0, self.contentView.frame.size.height - 1.0, self.contentView.frame.size.width, 6))

    lineView.backgroundColor = UIColor.darkGrayColor
    self.contentView.addSubview(lineView)

    self.contentView.backgroundColor = UIColor.whiteColor
    self.textLabel.textColor = UIColor.blackColor
    self.detailTextLabel.textColor = UIColor.grayColor

    self.textLabel.text = event.event_name
    self.detailTextLabel.text = event.initial_date.to_str + ' - ' + event.final_date.to_str
    
    # unless event.profile_image
    #   self.imageView.image = nil
    #   Dispatch::Queue.concurrent.async do
    #     profile_image_data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(event.event_image_url))
    #     if profile_image_data
    #       event.event_image = UIImage.alloc.initWithData(event_image_data)
    #       Dispatch::Queue.main.sync do
    #         self.imageView.image = event.profile_image
    #         tableView.delegate.reloadRowForTweet(event)
    #       end
    #     end
    #   end
    # else
    #   self.imageView.image = event.profile_image
    # end
  end
end