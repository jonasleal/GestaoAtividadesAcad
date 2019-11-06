class CreateBibliografia < ActiveRecord::Migration[5.1]
  def change
    create_table :bibliografia do |t|
      t.string :titulo
      t.string :descricao

      t.timestamps
    end
  end
end
