class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :starter, foreign_key: { to_table: 'recipes' }
      t.references :main, foreign_key: { to_table: 'recipes' }
      t.references :dessert, foreign_key: { to_table: 'recipes' }

      t.timestamps
    end
  end
end
