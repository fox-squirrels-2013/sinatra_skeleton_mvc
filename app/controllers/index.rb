require 'twitter'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @user = TwitterUser.create(:name => params[:twitter][:username])
  @tweets = Twitter.user_timeline(params[:twitter][:username])
  @tweets.each do |tweet|
  puts tweet.text
end
 redirect '/'
end



