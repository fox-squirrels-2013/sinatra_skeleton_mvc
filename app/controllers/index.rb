get '/' do
  # Twitter.update('tweeting from sinatra')
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  # params[:username]
  # find a way to grab a user's tweets
  # tweet = Twitter.user_timeline(params[:username], {count: 1})
  # "here are #{params[:username]}'s tweets"
  # p tweet.first.id

  # "https://twitter.com/GabbyMcNabb/status/400333249039183872"
  prefix = "https://twitter.com/"
  output = ""
  tweets = Twitter.user_timeline(params[:username], {count: 10})

  tweets.each do |t|
    url = "#{prefix}/#{t.user.screen_name}/status/#{t.id}"
    output += "<a target='_new' href='#{url}'>#{t.text}</a><br>"
  end

  output
end
