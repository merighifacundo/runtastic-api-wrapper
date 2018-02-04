class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :age, type: Numeric
  has_many :records
  index({ email: 1 }, { unique: true, name: "email_index" })
end
