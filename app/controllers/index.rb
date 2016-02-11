get '/' do
  # Look in app/views/index.erb
  redirect '/sessions/new'
end
