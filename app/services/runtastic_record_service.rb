require 'nokogiri'

class RuntasticRecordService
  include ServiceModule
  def get_records(slug, authenticationToken, cookies)
    response = RestClient.get('https://www.runtastic.com/en/users/token/statistics/records?type=latest'.gsub('token', slug),
                              headers = create_request(authenticationToken, cookies))

    JSON.parse response.body
  end
end