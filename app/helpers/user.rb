helpers do
  def authenticate
    redirect '/' unless signed_in?
  end

  def current_user
    @current_user ||= User.find_by(username: session[:username]) if session[:username]
  end

  def signed_in?
    !!current_user
  end
end


