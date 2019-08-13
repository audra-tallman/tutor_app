class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :subjects
  has_many :tutors, through: :subjects
end
