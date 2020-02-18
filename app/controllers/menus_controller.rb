class MenusController < ApplicationController
  before_action :set_menu, only: %i[edit update destroy]
  before_action :set_recipes, only: %i[new create edit update]

  def index
    @menus = Menu.all.order(:main_id)
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to menus_path, notice: 'Menu was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @menu.destroy

    redirect_to menus_path, notice: 'Menu was successfully destroyed.'
  end

  private

  def menu_params
    params.require(:menu).permit(:starter_id, :main_id, :dessert_id)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def set_recipes
    @starters = Recipe.starter.all.order(:name)
    @mains = Recipe.main.all.order(:name)
    @desserts = Recipe.dessert.all.order(:name)
  end
end
