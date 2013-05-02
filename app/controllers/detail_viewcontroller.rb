class DetailViewController < UIViewController

  def setEvent(event)
    @event = event
  end

  def searchForUserEvent
    url_string = "https://onessaweredisseseryounce:IiWpLORcxhNI6QmEsVCdeLU1@dequis.cloudant.com/events_users_schedule/#{@fb_user_name}_#{@event.event_id}"

    p "url_string para buscar evento: #{url_string}"

    error_ptr = Pointer.new(:object)
    BW::HTTP.get(url_string) do |response|
      parsed = BW::JSON.parse response.body.to_str

      p response.body.to_str

      if !parsed.nil?
        @user_event = UserEvent.new(parsed)
      end
      reloadData
    end
  end

  def reloadData
    if @user_event.user_event_id.nil?
      @interestButton.setOn(false)
    else
      @interestButton.setOn(true)
      @switchButton.setEnabled(true)
      p "El evento está scheduleado #{@user_event.is_scheduled}"
      @switchButton.setOn(@user_event.is_scheduled)
    end
  end

  def viewDidLoad
    initializeUI
    getUserName
    
  end

  def getUserName
      FBRequest.requestForMe.startWithCompletionHandler(lambda do |connection, user, error|
        if error.nil?
          @fb_user_name = "#{user[:username]}"
          searchForUserEvent
        else
          @fb_user_name = ""
        end
      end)
  end

  def initializeUI
    self.view.backgroundColor = UIColor.whiteColor

    @event_name_label = UILabel.new
    @event_name_label.font = UIFont.systemFontOfSize(15)
    @event_name_label.text = @event.event_name
    @event_name_label.textAlignment = UITextAlignmentCenter 
    @event_name_label.textColor = UIColor.blackColor
    @event_name_label.backgroundColor = UIColor.clearColor
    @event_name_label.frame = [[20, 20], [150, 30]]
    self.view.addSubview(@event_name_label)

    @initial_date_label = UILabel.new
    @initial_date_label.font = UIFont.systemFontOfSize(15)
    @initial_date_label.text = @event.initial_date
    @initial_date_label.textAlignment = UITextAlignmentCenter 
    @initial_date_label.textColor = UIColor.blackColor
    @initial_date_label.backgroundColor = UIColor.clearColor
    @initial_date_label.frame = [[20, 60], [150, 30]]
    self.view.addSubview(@initial_date)

    @final_date_label = UILabel.new
    @final_date_label.font = UIFont.systemFontOfSize(15)
    @final_date_label.text = @event.final_date
    @final_date_label.textAlignment = UITextAlignmentCenter 
    @final_date_label.textColor = UIColor.blackColor
    @final_date_label.backgroundColor = UIColor.clearColor
    @final_date_label.frame = [[20, 100], [150, 30]]
    self.view.addSubview(@final_date_label)

    @artist_label = UILabel.new
    @artist_label.font = UIFont.systemFontOfSize(15)
    @artist_label.text = @event.artist
    @artist_label.textAlignment = UITextAlignmentCenter 
    @artist_label.textColor = UIColor.blackColor
    @artist_label.backgroundColor = UIColor.clearColor
    @artist_label.frame = [[20, 140], [150, 30]]
    self.view.addSubview(@artist_label)

    @event_type_label = UILabel.new
    @event_type_label.font = UIFont.systemFontOfSize(15)
    @event_type_label.text = @event.event_type
    @event_type_label.textAlignment = UITextAlignmentCenter 
    @event_type_label.textColor = UIColor.blackColor
    @event_type_label.backgroundColor = UIColor.clearColor
    @event_type_label.frame = [[20, 180], [150, 30]]
    self.view.addSubview(@event_type_label)

    @place_label = UILabel.new
    @place_label.font = UIFont.systemFontOfSize(15)
    @place_label.text = @event.place
    @place_label.textAlignment = UITextAlignmentCenter 
    @place_label.textColor = UIColor.blackColor
    @place_label.backgroundColor = UIColor.clearColor
    @place_label.frame = [[20, 220], [150, 30]]
    self.view.addSubview(@place_label)

    @viewMapButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @viewMapButton.setTitle("Ver Mapa", forState: UIControlStateNormal);
    @viewMapButton.frame = [[80, 260],[160, 50]]
    @viewMapButton.addTarget(self, action: :viewMap, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@viewMapButton)

    @saveButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @saveButton.setTitle("Guardarrrr", forState: UIControlStateNormal);
    @saveButton.frame = [[80, 320],[160, 50]]
    @saveButton.addTarget(self, action: :saveUserEvent, forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@saveButton)

    @interestButton = UISwitch.alloc.initWithFrame([[180, 20], [40, 20]])
    @interestButton.addTarget(self,action:'interestIsChanged', forControlEvents:UIControlEventValueChanged)
    self.view.addSubview(@interestButton)

    @switchButton = UISwitch.alloc.initWithFrame([[180, 60], [40, 20]])
    @switchButton.addTarget(self,action:'switchIsChanged', forControlEvents:UIControlEventValueChanged)
    @switchButton.setEnabled(false)
    self.view.addSubview(@switchButton)
  end

  def interestIsChanged
    if @interestButton.on?
      @switchButton.setEnabled(true)
    else
      @switchButton.setEnabled(false)
    end
  end

  def switchIsChanged

  end

  def saveUserEvent
    if !@interestButton.on?
      deleteUserEvent
    else
      createOrUpdateUserEvent      
    end
  end

  def createOrUpdateUserEvent
    if (@fb_user_name != '')
      #Agendar eventStore
      url_string = "https://onessaweredisseseryounce:IiWpLORcxhNI6QmEsVCdeLU1@dequis.cloudant.com/events_users_schedule"

      if @user_event._rev.nil?
        json_string = "{\"FBUserName\":\"#{@fb_user_name}\", \"EventId\":\"#{@event.event_id}\", \"IsScheduled\":\"#{@switchButton.on?}\", \"AlertDate\":\"#{@alert_date}\", \"_id\":\"#{@fb_user_name}_#{@event.event_id}\"}"
      else
        json_string = "{\"FBUserName\":\"#{@fb_user_name}\", \"EventId\":\"#{@event.event_id}\", \"IsScheduled\":\"#{@switchButton.on?}\", \"AlertDate\":\"#{@alert_date}\", \"_id\":\"#{@fb_user_name}_#{@event.event_id}\", \"_rev\":\"#{@user_event._rev}\"}"
      end

      p "json_string #{json_string}"

      BW::HTTP.post(url_string, {
            :payload => json_string,
            :headers => {'Content-Type' => 'application/json'}
            }) do |response|      
        p response.to_s

        searchForUserEvent
      end
    end
  end

  def deleteUserEvent
    if @user_event._rev == ""
      url_string = "https://onessaweredisseseryounce:IiWpLORcxhNI6QmEsVCdeLU1@dequis.cloudant.com/crud/#{@fb_user_name}_#{@event.event_id}\?rev\=#{@user_event._rev}"

      p url_string

      BW::HTTP.delete(url_string) do response
        p "Eliminado #{response}"
      end
    end
  end

  def viewWillDisappear(animated)
    # if self.navigationController.viewControllers.indexOfObject(self) == NSNotFound
    #   saveUserEvent
    # end
    # super.viewWillDisappear(animated)
  end

  def viewMap
    where_controller = WhereController.alloc.init
    where_controller.setPoint(@event)
    self.navigationController.pushViewController(where_controller, animated: true)   
  end
end