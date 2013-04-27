class EventsTableViewController < UITableViewController
  def viewDidLoad
    @events = []
    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self;
    searchBar.showsCancelButton = true;
    searchBar.sizeToFit
    view.tableHeaderView = searchBar
    view.dataSource = view.delegate = self

    searchBar.text = 'search'
    searchBarSearchButtonClicked(searchBar)

    load_events
  end

  def searchBarSearchButtonClicked(searchBar)
  end

  def load_events
    @events = []

    url_string = "https://fordstituntsposighoweeme:SPmARNF2cvq8iAagqcE1Am6k@dequis.cloudant.com/eventsdb/_all_docs?include_docs=true"


    error_ptr = Pointer.new(:object)
    BW::HTTP.get(url_string) do |response|
      parsed = BW::JSON.parse response.body.to_str

      if parsed.nil?
        p 'sin datos'
      else
        parsed.each do |item|       
          
          next if item[0] != 'rows'
          
          item[1].each do |item1|
              @events << Event.new(item1["doc"])
              self.view.reloadData
          end
        end
      end
    end
  end

  def tableView(tableView, numberOfSectionsInTableView:section)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @events.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    event = @events[indexPath.row]
    EventCell.cellForEvent(event, inTableView:tableView)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    event = @events[indexPath.row]
    if event.sub_events.any?
      sub_event_controller = SubEventsTableViewController.alloc.init
      sub_event_controller.setEvent(event)
      self.navigationController.pushViewController(sub_event_controller, animated: true)    
    else
      detail_controller = DetailViewController.alloc.init
      detail_controller.setEvent(event)
      self.navigationController.pushViewController(detail_controller, animated: true)   
      
    end

  end
end