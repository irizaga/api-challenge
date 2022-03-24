class CreateRaffles < ActiveRecord::Migration[7.0]
  def change
    create_table :raffles do |t|
      t.string :name
      t.string :cpf
      t.datetime :win_date

      t.timestamps
    end
  end
end
