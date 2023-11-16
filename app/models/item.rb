class Item < ApplicationRecord
  validates :name, presence: true
  default_scope { where(deleted_at: nil) }

  def soft_delete
    update_attribute(:deleted_at, Time.now)
  end

  def restore
    update_attribute(:deleted_at, nil)
  end
end
