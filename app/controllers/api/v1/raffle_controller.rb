# frozen_string_literal: true

class Api::V1::RaffleController < Api::BaseController
  def index
    @winners = Raffle.all
    render json: @winners, each_serializer: RaffleSerializer
  end

  def pick
    pool = Person.count
    winner = false

    while winner == false
      picked = Person.find_by(id: rand(1..pool))
      winner = WinnerPick.call(picked)
    end

    render json: winner, serializer: RaffleSerializer
  end
end
