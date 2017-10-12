class ProductPolicy < ApplicationPolicy
  def update?
    user_who_can_access_product
  end

  def edit?
    user_who_can_access_product
  end

  def user_who_can_access_product
    record.user_id == user.id
  end
end
