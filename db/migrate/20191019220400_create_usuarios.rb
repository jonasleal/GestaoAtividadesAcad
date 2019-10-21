class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :senha
      t.string :nome
      t.string :cpf
      t.string :curso
      t.string :especificao

      t.timestamps
    end
  end
end
