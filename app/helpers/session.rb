helpers do

def login(user)
  session[:id] = user.id
end

def logged_in?
  session[:id] != nil
end

def logout
  session[:id] = nil
end

end

