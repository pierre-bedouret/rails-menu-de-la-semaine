class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :categorie
      t.integer :difficulty
      t.integer :prep_time
      t.integer :cooking_time

      t.timestamps
    end
  end
end
