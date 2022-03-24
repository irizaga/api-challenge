# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe Raffle, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :cpf }
  it { should validate_uniqueness_of :cpf }
  it { should validate_presence_of :win_date }
end
