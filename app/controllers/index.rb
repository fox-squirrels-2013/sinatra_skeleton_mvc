
get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  # @username=params[:username]
  @user = TwitterUser.find_by_username(params[:username])
  p @user
  if @user.tweets.empty?

    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)
  p "@tweets - #{@tweets}"
  erb :user_tweets
end
