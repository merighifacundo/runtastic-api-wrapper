class RuntasticRecordService

  def get_records(slug, authenticationToken, cookies)
    response =  RestClient.get('https://www.runtastic.com/en/users/token/statistics/records?type=latest'.gsub('token', slug),headers={
        'Content-Type': 'application/x-www-form-urlencoded',
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9',
        'Referer': 'https://www.runtastic.com',
        'X-App-Version': '1.0',
        'X-App-Key': 'com.runtastic.ember',
        'X-CSRF-Token': authenticationToken,
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json, text/javascript,	application/vnd.api+json, */*; q=0.01',
        'DNT': 1,
        'Cookie': cookies
    } )

    data = JSON.parse response.body
  end
end