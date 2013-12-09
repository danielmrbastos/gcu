class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.boolean :ind_ativo
			t.decimal :fator_tecnico
			t.decimal :fator_ambiental

      t.timestamps
    end
  end
end
