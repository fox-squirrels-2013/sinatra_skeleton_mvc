
get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  # @user = TwitterUser.find_by_username(params[:username])
  # @user = TwitterUser.find_by_username("upstart")
  # @user = TwitterUser.create!()
  # Twitter.user(params[:username])
  # @user = Twitter.find_by_username(params[:username])
  p '*'*180
  p "params:"
  p params
  # p "Username:"
  # p @user = TwitterUser.create!(Twitter.user(params[:username]))
  @user = Twitter.user(params[:username])
  @user.attrs.sort.each do |key, value|
    p "#{key} : #{value}"
  end
  # if @user.tweets.empty?

  #   @user.fetch_tweets!
  # end

  # @tweets = @user.tweets.limit(10)
  # p "@tweets - #{@tweets}"
  # erb :user_tweets
end
