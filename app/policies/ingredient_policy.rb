class IngredientPolicy < ApplicationPolicy
  def update?
    user_who_can_access_ingredient
  end

  def edit?
    user_who_can_access_ingredient
  end

  def user_who_can_access_ingredient
    record.user_id == user.id
  end
end
