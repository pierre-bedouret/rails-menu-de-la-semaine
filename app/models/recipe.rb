class Recipe < ApplicationRecord
  ########## CONSTANTS ########
  CATEGORIES = %w[Entrée Plat Dessert].freeze
  DIFFICULTIES = [
    ['Non défini', 0],
    ['Très Facile', 1],
    ['Facile', 2],
    ['Moyen', 3],
    ['Difficile', 4],
    ['Très Difficile', 5]
  ].freeze

  ########## ASSOCIATIONS ########
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  ########## VALIDATIONS ##########
  validates :name, presence: true, uniqueness: true
  validates :prep_time, :cooking_time, numericality: { greater_than_or_equal: 0 }

  ########## INSTANCES METHODS ########
  def difficulty_to_human
    DIFFICULTIES[difficulty][0]
  end
end
