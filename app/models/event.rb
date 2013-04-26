class Event
  attr_reader :event_name, :initial_date, :final_date, :artist, :event_type, :sub_events
  # , :event_image_url
  # attr_accessor :event_image

  def initialize(dict)

    @sub_events = []
    @event_name = dict['EventName']
    @initial_date = dict['InitialDate']
    @final_date = dict['FinalDate']
    @artist = dict['Artist']
    @event_type = dict['EventType']

    if (dict.include? 'SubEvents')
      dict['SubEvents'].each do |item|
        if !item.nil?
          @sub_events << Event.new(item)
        end
      end
    end
    # @event_image_url = nil
    # dict['ImageUrl']
    # @event_image = nil	
  end
end