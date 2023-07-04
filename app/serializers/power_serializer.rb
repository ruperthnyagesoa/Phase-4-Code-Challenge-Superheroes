class PowerSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  # has_many :heroes, through: :heropowers
  # has_many :heropowers
end
