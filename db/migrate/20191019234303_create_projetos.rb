class CreateProjetos < ActiveRecord::Migration[5.1]
  def change
    create_table :projetos do |t|
      t.string :titulo
      t.string :area
      t.date :dataFin
      t.date :dataInicio
      t.string :tipoProjeto
      t.boolean :status

      t.timestamps
    end
  end
end
