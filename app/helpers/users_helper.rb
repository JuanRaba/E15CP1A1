module UsersHelper
  def logged?
    session[:user_id].present? # present? returns boolean :/ ? true : false 
  end
  def current_user
    User.find(session[:user_id]) 
  end
  def current_user_name
    if logged?
      current_user.name
    else
      'no registrado'
    end
  end
end
