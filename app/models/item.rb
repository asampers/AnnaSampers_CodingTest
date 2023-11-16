class Item < ApplicationRecord
  validates :name, presence: true

  def soft_delete
    update_attribute(:deleted_at, Time.now)
  end

  def restore
    update_attribute(:deleted_at, nil)
  end
end
