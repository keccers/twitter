########## INDEX ###########
before '/' do
  redirect '/tweet' if current_user
end

get '/' do
  erb :index
end

########## TWEET ###########

before '/tweet*' do
  authenticate
end
  
get '/tweet' do
  if request.xhr? 
   erb :_success, layout: false
  else
    erb :tweet
  end
end

post '/tweet/create' do
  current_user.delay_until(1.minute.from_now).tweet(params[:text]) 
end

########## USER ###########

get '/sign_in' do
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/auth' do
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  session.delete(:request_token)

  @current_user = User.find_or_create_by(username: @access_token.params[:screen_name],
                                 oauth_token: @access_token.params[:oauth_token],
                                 oauth_secret: @access_token.params[:oauth_token_secret])
  
  session[:username] = @current_user.username
  redirect '/tweet'
end

########## JOBS ###########
get '/status/:job_id' do
  status = job_is_complete(params[:job_id])

  content_type :json
  {status: status}.to_json
end
