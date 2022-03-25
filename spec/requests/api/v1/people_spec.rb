# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/people', type: :request do
  path '/api/v1/people' do
    get('list people') do
      security [Token: []]
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create person') do
      security [Token: []]
      response(201, 'successful') do
        consumes 'application/json'
        parameter name: :person, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            cpf: { type: :string },
            birthdate: { type: :string, format: :date }
          },
          required: ['name', 'cpf', 'birthdate']
        }
        run_test!
      end

      response(402, 'invalid data') do
        consumes 'application/json'
        parameter name: :person, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            cpf: { type: :string },
            birthdate: { type: :string, format: :date }
          },
          required: ['name', 'cpf', 'birthdate']
        }
        run_test!
      end
    end
  end

  path '/api/v1/people/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show person') do
      security [Token: []]
      response(200, 'successful') do
        let(:id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'person not found') do
        let(:id) { '0' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update person') do
      consumes 'application/json'
      parameter name: :person, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cpf: { type: :string },
          birthdate: { type: :string, format: :date }
        }
      }
      security [Token: []]
      response(200, 'successful') do
        let(:id) { '0' }
        let(:name) { 'New name' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'person not found') do
        let(:id) { '0' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'invalid data') do
        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete person') do
      security [Token: []]
      response(204, 'successful') do
        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'person not found') do
        let(:id) { '0' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
