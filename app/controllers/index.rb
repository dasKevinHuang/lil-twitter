get '/' do
  # Look in app/views/index.erb

# if login?
#   redirect '/dashboard'
# end
  erb :'index'
end
