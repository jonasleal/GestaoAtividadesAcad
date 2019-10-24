class CreateTrabalhos < ActiveRecord::Migration[5.1]
  def change
    create_table :trabalhos do |t|
      t.string :funcao
      t.references :projeto, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
