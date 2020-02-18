class Menu < ApplicationRecord
  belongs_to :starter, class_name: 'Recipe', optional: true
  belongs_to :main, class_name: 'Recipe'
  belongs_to :dessert, class_name: 'Recipe', optional: true

  validates :main, uniqueness: { scope: %i[starter dessert], message: "this menu composition already been existed" }

  # instance method : to get all the ingredients for a menu
  def ingredients
    ingredients = main.ingredients
    ingredients += starter.ingredients if starter.present?
    ingredients += dessert.ingredients if dessert.present?

    ingredients
  end
end
