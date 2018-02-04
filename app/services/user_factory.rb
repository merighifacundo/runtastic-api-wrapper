class UserFactory

  def self.build_or_retrieve(loginInformation)
    begin
      @user = User.find_by(email: loginInformation[:email])
      @user[:password] = loginInformation[:password]
      @user[:runtastic_id] = loginInformation[:user]['id']
    rescue Mongoid::Errors::DocumentNotFound
      user_name = loginInformation[:user]['first_name'] + " " + loginInformation[:user]['last_name']
      @user = User.new({name: user_name,
                age: loginInformation[:user]['age'],
                email: loginInformation[:user]['email'],
                password: loginInformation[:password]})
    end
    @user

  end

end