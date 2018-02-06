class ActivityHelper
  def self.existActivity(user_id, id)
    return ActivityLog.where(user_id: user_id, activity_id: id).exists?
  end

end