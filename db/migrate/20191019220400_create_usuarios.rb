class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :cpf
      t.string :curso

      t.timestamps
    end
  end
end
