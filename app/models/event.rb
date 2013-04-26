class Event
  attr_reader :event_name, :initial_date, :final_date, :artist, :event_type
  # , :event_image_url
  # attr_accessor :event_image

  def initialize(dict)

    @event_name = dict['EventName']
    p @event_name.to_s + ' event name'
    @initial_date = dict['InitialDate']
    @final_date = dict['FinalDate']
    @artist = dict['Artist']
    @event_type = dict['EventType']

    if (dict['SubEvents'])
      parsed = BW::JSON.parse dict['SubEvents']
      parsed.each do |item|
        @sub_events << Event.new(item)
      end
    end
    # @event_image_url = nil
    # dict['ImageUrl']
    # @event_image = nil	
  end
end