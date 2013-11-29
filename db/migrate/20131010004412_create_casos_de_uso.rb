class CreateCasosDeUso < ActiveRecord::Migration
  def change
    create_table :casos_de_uso do |t|
      t.string :nome
			t.string :precondicao
			t.string :poscondicao
      t.integer :projeto_id
			t.string :situacao, :null => false

      t.timestamps
    end
  end
end
