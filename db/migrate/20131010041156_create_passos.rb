class CreatePassos < ActiveRecord::Migration
  def change
    create_table :passos do |t|
      t.string :nome
      t.integer :fluxo_id

      t.timestamps
    end
  end
end
