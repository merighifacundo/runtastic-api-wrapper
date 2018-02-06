class ActivityHelper
  def self.existActivity(user, id)
    return ActivityLog.where(user_id: user[:id], activity_id: id).exists?
  end

end