class CreateAtores < ActiveRecord::Migration
  def change
    create_table :atores do |t|
    	t.string :nome
			t.integer :projeto_id

      t.timestamps
    end
  end
end
