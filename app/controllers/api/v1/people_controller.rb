# frozen_string_literal: true

class Api::V1::PeopleController < Api::BaseController
  def index
    @people = Person.all

    render json: @people, each_serializer: PersonSerializer
  end

  def show
    @person = Person.find(params[:id])

    render json: @person, serializer: PersonSerializer
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created, serializer: PersonSerializer
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      render json: @person, serializer: PersonSerializer
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
  end

  private

  def person_params
    params.require(:person).permit(:name, :cpf, :birthdate)
  end
end
