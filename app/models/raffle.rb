# frozen_string_literal: true

class Raffle < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :win_date, presence: true
end
