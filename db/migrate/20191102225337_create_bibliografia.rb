class CreateBibliografia < ActiveRecord::Migration[5.1]
  def change
    create_table :bibliografia do |t|
      t.string :titulo
      t.string :descricao
      t.references :projeto, foreign_key: true
      t.timestamps
    end
  end
end
