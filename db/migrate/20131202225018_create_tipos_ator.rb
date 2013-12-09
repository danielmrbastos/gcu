class CreateTiposAtor < ActiveRecord::Migration
  def change
    create_table :tipos_ator do |t|
      t.string :sigla
      t.string :descricao

      t.timestamps
    end
  end
end
