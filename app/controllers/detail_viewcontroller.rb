class DetailViewController < UIViewController

  def setEvent(event)
    @event = event
  end

  def viewDidLoad

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

    @switchButton = UISwitch.alloc.initWithFrame([[180, 20], [40, 20]])
    @switchButton.addTarget(self,action:'switchIsChanged', forControlEvents:UIControlEventValueChanged)
    # @switchButton.setOn(false, animated:false)
    self.view.addSubview(@switchButton)
  end

  def switchIsChanged
    if @switchButton.on?
      FBRequest.requestForMe.startWithCompletionHandler(lambda do |connection, user, error|
        if error.nil?
          @fb_user_name = "#{user[:username]}"
          @fb_name = "#{user[:name]}"
          p "logged in"
        else
          p "not logged in"
          p error.description
        end
      end)

      p "UserName #{@fb_user_name}"
      p "Name #{@fb_name}"

      #Agendar evento
      url_string = "https://onessaweredisseseryounce:IiWpLORcxhNI6QmEsVCdeLU1@dequis.cloudant.com/events_users_schedule"

      json_string = "{\"fb_user_name\":\"#{@fb_user_name}\", \"event_id\":\"#{@event.event_id}\", \"_id\":\"#{@fb_user_name}_#{@event.event_id}\"}"
      # json_string = {fb_user_name:"#{@fb_user_name}", event_id:"#{@event.event_id}", _id:"#{@fb_username}_#{@event.event_id}"}

      p "json_string #{json_string}"

      BW::HTTP.post(url_string, {
            :payload => json_string,
            :headers => {'Content-Type' => 'application/json'}
            }) do |response|      
        p response.to_s
      end
    else
     #Desagendar evento
    end
  end

  def viewMap
    where_controller = WhereController.alloc.init
    where_controller.setPoint(@event)
    self.navigationController.pushViewController(where_controller, animated: true)   
  end
end