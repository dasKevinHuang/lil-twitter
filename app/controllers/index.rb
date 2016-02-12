get '/' do
  # Look in app/views/index.erb

if logged_in?
  redirect '/dashboard'
end
  erb :'index'
end
