class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.boolean :ind_ativo

      t.timestamps
    end
  end
end
