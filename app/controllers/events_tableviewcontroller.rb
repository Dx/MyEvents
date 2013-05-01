class EventsTableViewController < UITableViewController
  def viewDidLoad
    @events = []

    bgLayer = Skin.greyGradient
    bgView = UIView.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.frame.size.height))
    bgLayer.frame = bgView.bounds;
    bgView.layer.insertSublayer(bgLayer, atIndex:0);
    view.backgroundView = bgView   

    view.separatorStyle = UITableViewCellSeparatorStyleNone 

    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self;
    searchBar.showsCancelButton = true;
    searchBar.sizeToFit
    #view.backgroundView = searchBar
    searchBar.text = 'search'
    searchBarSearchButtonClicked(searchBar)

    loadHeaderView

    view.dataSource = view.delegate = self

    load_events
  end

  def searchBarSearchButtonClicked(searchBar)
  end

  def loadHeaderView
    headerView = UIView.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 50))
    
    lineView = UIView.alloc.initWithFrame(CGRectMake(35, 5, 1, 45))
    lineView.backgroundColor = UIColor.whiteColor
    headerView.addSubview(lineView)

    bgLayer = Skin.greyGradient
    bgLayer.frame = headerView.bounds;
    headerView.layer.insertSublayer(bgLayer, atIndex:0);

    imageView = Skin.roundButton
    imageView.frame = [[15, 5],[40, 40]]
    imageView.setImage(UIImage.imageNamed("profileImage.png"), forState:UIControlStateNormal)
    headerView.addSubview(imageView)

    labelView = Skin.labelRoundButton("Facebook")
    labelView.frame = [[60, 7], [135, 30]]
    headerView.addSubview(labelView)
    view.tableHeaderView = headerView
  end

  def loadFooterView
    footerView = UIView.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 30))
    
    lineView = UIView.alloc.initWithFrame(CGRectMake(35, 0, 1, 20))
    lineView.backgroundColor = UIColor.whiteColor
    footerView.addSubview(lineView)

    bgFooterLayer = Skin.greyGradient
    bgFooterLayer.frame = footerView.bounds;
    footerView.layer.insertSublayer(bgFooterLayer, atIndex:0);

    searchView = Skin.searchButton
    searchView.frame = [[26, 4],[20, 20]]
    searchView.setImage(UIImage.imageNamed("button.png"), forState:UIControlStateNormal)
    footerView.addSubview(searchView)

    searchLabelView = Skin.labelRoundButton("Buscar Eventos")
    searchLabelView.frame = [[52, 4], [220, 20]]
    searchLabelView.font = UIFont.systemFontOfSize(8)
    footerView.addSubview(searchLabelView)
    view.tableFooterView = footerView
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
        loadFooterView
      end
    end
  end

  def tableView(tableView, numberOfSectionsInTableView:section)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    if @events != nil
      @events.size
    end
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