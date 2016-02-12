
# To display all tweets of ALL users
get '/tweets' do

end

# To create new tweet form
get '/tweets/new' do

  if
    redirect "/user/#{@user.id}"
  else
    redirect "/tweets/new"
  end
end
