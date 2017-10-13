class IngredientsController < ApplicationController
before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  def index
    @ingredients = Ingredient.ingredients_by(current_user)
  end

  def new
    @ingredient = Ingredient.new
  end

  def show
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user_id = current_user.id


    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    @ingredient.destroy

    redirect_to ingredients_path, notice: "Your ingredient was deleted successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :amount, :min_amount, :amount_type, :user_id)
    end
end
