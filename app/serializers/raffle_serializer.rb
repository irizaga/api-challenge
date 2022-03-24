# frozen_string_literal: true

class RaffleSerializer < ActiveModel::Serializer
  attributes :name, :cpf, :win_date
end
