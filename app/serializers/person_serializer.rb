# frozen_string_literal: true

class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :birthdate
end
