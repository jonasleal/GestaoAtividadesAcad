class CreateHistoricoAtividades < ActiveRecord::Migration[5.1]
  def change
    create_table :historico_atividades do |t|
      t.boolean :status
      t.references :atividade, foreign_key: true
      t.date :dataModificacao
      t.string :especicacao
      t.timestamps

    end
  end
end
