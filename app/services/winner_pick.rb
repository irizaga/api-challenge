# frozen_string_literal: true

class WinnerPick < ApplicationService
  def initialize(person)
    @person = person
  end

  def call
    winner_pick
  end

  private

  def winner_pick
    winner = Raffle.new(name: @person.name, cpf: @person.cpf, win_date: DateTime.now)
    return winner if winner.save

    false
  end
end
