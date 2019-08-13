class TutorSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :email, :subject, :bio
  has_many :subjects
  has_many :users, through: :subjects
end
