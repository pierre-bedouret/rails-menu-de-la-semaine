class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.text :recipes, array: true, default: []

      t.timestamps
    end
  end
end
