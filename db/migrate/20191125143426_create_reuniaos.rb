class CreateReuniaos < ActiveRecord::Migration[5.1]
  def change
    create_table :reuniaos do |t|
      t.string :nome
      t.date :data
      t.int :tempoReuniao
      t.string :observacao
      t.boolean :status

      t.timestamps
    end
  end
end
