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
  has_many :starter_menus, class_name: 'Menu', foreign_key: 'starter_id'
  has_many :main_menus, class_name: 'Menu', foreign_key: 'main_id'
  has_many :dessert_menus, class_name: 'Menu', foreign_key: 'dessert_id'

  ########## VALIDATIONS ##########
  validates :name, presence: true, uniqueness: true
  validates :prep_time, :cooking_time, numericality: { greater_than_or_equal: 0 }

  ########## SCOPES ##########
  scope :starter, -> { where(categorie: 'Entrée') }
  scope :main, -> { where(categorie: 'Plat') }
  scope :dessert, -> { where(categorie: 'Dessert') }

  ########## INSTANCES METHODS ########
  def difficulty_to_human
    DIFFICULTIES[difficulty][0]
  end
end
