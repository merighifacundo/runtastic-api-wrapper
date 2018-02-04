class ActivityLog
  include Mongoid::Document
  field :activity_id, type: Numeric
  field :original_data, type: String
  field :date, :type => Date
  field :data, type: Hash
  belongs_to :user
end