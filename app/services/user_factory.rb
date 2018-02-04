class UserFactory

  def self.build(userInformation)
    user_name = loginInformation[:user]['first_name'] + " " + loginInformation[:user]['last_name']
    User.new({name: user_name,
              age: loginInformation[:user]['age'],
              email: loginInformation[:user]['email'],
              password: loginInformation[:password]})
  end

end