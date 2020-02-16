class RecipeIngredientsController < ApplicationController
  before_action :set_recipe

  def new
    @recipe_ingredient = RecipeIngredient.new
    @ingredients = Ingredient.where.not(id: @recipe.ingredients.ids).order(:name)
  end

  def create
    @quantity = recipe_ingredient_params[:quantity]
    @ingredient = Ingredient.find(recipe_ingredient_params[:ingredient])

    @recipe_ingredient = RecipeIngredient.new(recipe: @recipe, ingredient: @ingredient, quantity: @quantity)

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

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:quantity, :ingredient)
  end
end
