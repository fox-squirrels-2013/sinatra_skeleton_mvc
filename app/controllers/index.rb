get '/' do
  # Twitter.update('tweeting from sinatra')
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  # params[:username]
  tweet_links(params[:username])
end


def tweet_links(twitter_name)
  prefix = "https://twitter.com/"
  output = ""
  tweets = Twitter.user_timeline(twitter_name, {count: 10})

  tweets.each do |t|
    url = "#{prefix}/#{t.user.screen_name}/status/#{t.id}"
    output += "<a target='_new' href='#{url}'>#{t.text}</a><br>"
  end
  output
end
