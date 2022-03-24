# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PeopleController, type: :controller do
  before do
    request.headers['Authorization'] = 'Token token=token'
  end
  
  describe 'people#index' do
    it 'starts with no people registered' do
      get :index
      person = assigns :people
      expect(person.length).to eq(0)
    end

    it 'registers new user correctly' do
      Person.create!(name: 'Joao', cpf: '000000000', birthdate: '01/01/1980')
      get :index
      person = assigns :people
      expect(person.length).to eq(1)
    end
  end

  describe 'people#show' do
    before do
      @person = Person.create!(name: 'Joao', cpf: '000000000', birthdate: '01/01/1980')
    end

    it 'shows user info' do
      get :show, params: { id: @person.id }
      expect(response.body).to match('"name":"Joao"')
    end
  end

  describe 'people#create' do
    it 'person creation returns status 201' do
      post(:create, params: { person: { name: 'Joao', cpf: '000000000', birthdate: '01/01/1980' } })
      expect(response.status).to eq(201)
    end
  end

  describe 'people#update' do
    before do
      @target_person = Person.create!(name: 'Joao', cpf: '000000000', birthdate: '01/01/1980')
    end

    it 'person update alters params' do
      patch :update, params: { id: @target_person.id, person: { name: 'Jose' } }
      @target_person.reload
      expect(response.body).to match('"Jose"')
    end
  end

  describe 'people#delete' do
    before do
      @target_person = Person.create!(name: 'Joao', cpf: '000000000', birthdate: '01/01/1980')
    end

    it 'person update alters params' do
      delete :destroy, params: { id: @target_person.id }
      expect(Person.count).to eq(0)
    end
  end
end
