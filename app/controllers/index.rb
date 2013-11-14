get '/' do
  # Look in app/views/index.erb

  oauth_access_token = 'CAACEdEose0cBAGVnuTrXLDrzHdVSgNp5suh2RRCfM9iuZBaRZCutyRMtKaOF2zMWrapbN8YEJTtsnRpXHnLwOdrT8OhUDRUUgZAxnoN3IaxzspUp0JpcywDhOfjuuFtRgPwz7AP90OGsmnZCRSaW3cZBJnHZAXwpMy600U9n8ZCL29FDvRVpY4E048UznVRZC4ptE5JLZCRbclgZDZD'

  @graph = Koala::Facebook::API.new(oauth_access_token)

  profile = @graph.get_object("me")
  friends = @graph.get_connections("me", "friends")
  p @graph
  p profile
  p friends
 #  @graph.put_connections("me", "feed", :message => "I am writing on my wall!")

	# # three-part queries are easy too!
	# @graph.get_connections("me", "mutualfriends/#{friend_id}")

	# # you can even use the new Timeline API
	# # see https://developers.facebook.com/docs/beta/opengraph/tutorial/
	# @graph.put_connections("me", "namespace:action", :object => object_url)

erb :index

end
