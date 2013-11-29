class CreateCasosDeUsoAtor < ActiveRecord::Migration
  def change
    create_table :casos_de_uso_ator do |t|
      t.integer :caso_de_uso_id
      t.integer :ator_id

      t.timestamps
    end
  end
end
