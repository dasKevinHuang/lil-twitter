class User < ActiveRecord::Base

  def self.authenticate(email, password)
    @user = self.find_by(email: email)
    if @user
      if @user.password == password
        return @user
      end
    end
    return nil
  end

end
