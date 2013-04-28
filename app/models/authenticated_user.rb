class AuthenticatedUser
  attr_reader :user_name
  
  def initialize(dict)

    @user_name = dict['UserName']
    
  end
end