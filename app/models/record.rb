class Record
  include Mongoid::Document
  field :name, type: String
  field :value, type: String
  belongs_to :user
end