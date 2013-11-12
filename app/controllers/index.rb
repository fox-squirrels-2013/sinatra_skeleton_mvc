get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @user_tweets= Twitter.user_timeline(params[:username],:count =>10)
  erb :username
end

