class User
  include Mongoid::Document
  field :name, type: String
  field :runtastic_id, type: Numeric
  field :email, type: String
  field :password, type: String
  field :age, type: Numeric
  has_many :records
  has_many :activity_logs
  index({ email: 1 }, { unique: true, name: "email_index" })
end
