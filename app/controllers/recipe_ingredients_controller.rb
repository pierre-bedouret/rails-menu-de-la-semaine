class RecipeIngredientsController < ApplicationController
  before_action :set_recipe
  before_action :set_ingredients

  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params.merge(recipe: @recipe))

    if @recipe_ingredient.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @recipe_ingredient.destroy
    redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully removed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_ingredients
    @ingredients = Ingredient.where.not(id: @recipe.ingredients.ids).order(:name)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:quantity, :ingredient_id)
  end
end
