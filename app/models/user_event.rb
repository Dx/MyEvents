class UserEvent
    attr_reader :user_event_id, :_rev, :event_id, :fb_user_name, :is_scheduled, :alert_date

  def initialize(dict)

  	if !dict['_id'].nil?
    @user_event_id = dict['_id']
    @_rev = dict['_rev']
    @event_id = dict['EventId']
    @fb_user_name = dict['FBUserName']
    @is_scheduled = dict['IsScheduled'] == "true"
    @alert_date = dict['AlertDate']
	else
		nil
	end
  end
end