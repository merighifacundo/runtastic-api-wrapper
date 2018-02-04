class ActivityLog
  include Mongoid::Document
  field :activity_id, type: Numeric
  field :date, type: String
  field :data, type: Hash
  belongs_to :user
end