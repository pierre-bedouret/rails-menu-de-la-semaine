class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :quantity
      t.references :recipe
      t.references :ingredient

      t.timestamps
    end
  end
end
