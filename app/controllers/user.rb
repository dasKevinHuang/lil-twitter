get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.create(params[:user])
  redirect "/"
end

get '/users' do
  @users = User.all
  erb :'users/all'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
