require 'nokogiri'
require 'rest-client'

class LoginService
  def login(username, password)
    response = RestClient.post('https://www.runtastic.com/en/d/users/sign_in.json', {'user[email]': username, 'user[password]': password})
    cookies = response.cookies.map {|k, v| "#{k}=#{v}"}.join('; ')
    data = JSON.parse response.body
    user = data['current_user']
    token = Nokogiri::HTML(data['update']).search('input[name=authenticity_token]').attr('value')
    {user: user, cookies: cookies, authenticationToken: token, password: password}
  end
end