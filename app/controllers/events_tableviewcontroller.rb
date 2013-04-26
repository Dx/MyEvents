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
              p item1["doc"]
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
    p indexPath.row.to_s + ' row'
    EventCell.cellForEvent(event, inTableView:tableView)
  end
end