class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :cardtype
      t.string :image
      t.integer :cost
      t.integer :attack
      t.integer :health

      t.timestamps
    end
  end
end
