class RecipePolicy < ApplicationPolicy
  def update?
    user_who_can_access_recipe
  end

  def edit?
    user_who_can_access_recipe
  end

  def user_who_can_access_recipe
    record.user_id == user.id
  end
end
