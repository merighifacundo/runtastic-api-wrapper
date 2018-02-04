class ApplicationJob
  include SuckerPunch::Job

  def perform(event)
    @users = User.all
    @users.each do |user|
      loginInformation =  LoginService.new().login(user[:email],user[:password])
      response = RuntasticRecordService.new().get_records(loginInformation[:user]['slug'],loginInformation[:authenticationToken],loginInformation[:cookies]);
      response['records'].each do |record|
        @record = Record.new({'name':record['record_type'], 'value': record['value']})
        @record.save
        user.records.push(@record)
        user.save
      end
    end
  end
end
