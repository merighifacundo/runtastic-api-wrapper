class User
  include Mongoid::Document
  field :name, type: String
  field :runtastic_id, type: Numeric
  field :email, type: String
  field :password, type: String
  field :age, type: Numeric
  field :alexa_integration, type: Boolean
  attr_accessor :position
  has_many :records
  has_many :activity_logs
  def as_json(options={})
    super(options).except('password')
  end
  index({ email: 1 }, { unique: true, name: "email_index" })
end
