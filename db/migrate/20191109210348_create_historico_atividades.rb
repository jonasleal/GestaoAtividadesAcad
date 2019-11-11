class CreateHistoricoAtividades < ActiveRecord::Migration[5.1]
  def change
    create_table :historico_atividades do |t|
      t.string :status
      t.references :atividade, foreign_key: true
      t.timestamps
    end
  end
end
