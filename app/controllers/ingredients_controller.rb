class IngredientsController < ApplicationController
#before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user_id = current_user.id


    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
#    def set_ingredient
#      @ingredient = ingredient.find(params[:id])
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :amount, :min_amount, :amount_type, :user_id)
    end
end
