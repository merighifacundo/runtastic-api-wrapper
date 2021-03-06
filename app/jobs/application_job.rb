class ApplicationJob
  include SuckerPunch::Job

  def perform(event)
    @users = User.all
    @users.each do |user|
      loginInformation = LoginService.new().login(user[:email], user[:password])
      process_activities(loginInformation,user)
      process_records(loginInformation,user)

    end
  end

  private

  def process_activities(loginInformation,user)

    activities = RuntasticActivitiesService.new().get_activities(loginInformation[:user]['slug'],  loginInformation[:user]['id'], user[:id], loginInformation[:authenticationToken], loginInformation[:cookies]);
    activities.each do |activity|
      @activity_log = ActivityLog.new(activity)
      @activity_log.user = user
      @activity_log.save!
      user.activity_logs.push(@activity_log)
      user.save!
    end
  end

  def process_records(loginInformation,user)
    response = RuntasticRecordService.new().
        get_records(loginInformation[:user]['slug'],
                    loginInformation[:authenticationToken],
                    loginInformation[:cookies]);

    response['records'].each do |record|
      @record = RecordHelper.build_or_retrieve(record, user)
      @record.user = user
      @record.save!
      user.records.push(@record)
      user.save!
    end
  end

end
