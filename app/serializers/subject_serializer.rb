class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :tutor_id, :user_id
  belongs_to :tutor
end
