# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe WinnerPick, type: :service do
  before do
    @picked = Person.create(name: 'John', cpf: '0', birthdate: '01/01/01')
  end

  context 'person is picked' do
    it 'winner is valid' do
      winner = described_class.call(@picked)
      expect(winner.name).to eq(@picked.name)
    end
  end
end
