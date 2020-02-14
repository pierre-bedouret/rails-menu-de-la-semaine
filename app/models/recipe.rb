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
  has_many :ingredients

  ########## VALIDATIONS ##########
  validates :name, presence: true, uniqueness: true
  validates :prep_time, :cooking_time, numericality: { greater_than: 0 }

  ########## INSTANCES METHODS ########
  def difficulty_to_human
    DIFFICULTIES[difficulty][0]
  end
end
