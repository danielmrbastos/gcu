class CreateFluxos < ActiveRecord::Migration
  def change
    create_table :fluxos do |t|
      t.string :nome
      t.integer :caso_de_uso_id

      t.timestamps
    end
  end
end
