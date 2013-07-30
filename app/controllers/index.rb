get '/' do
  
  if request.xhr?
    erb :_success
  else
    erb :index
  end
end

post '/create_tweet' do
  Twitter.update(params[:text])
  redirect '/'
end
