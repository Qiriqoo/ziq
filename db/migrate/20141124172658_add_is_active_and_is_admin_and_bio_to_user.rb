class AddIsActiveAndIsAdminAndBioToUser < ActiveRecord::Migration
  def change
    add_column(:users, :is_active, :boolean, default: false)
    add_column(:users, :is_admin, :boolean, default: false)
    add_column(:users, :bio, :text)
  end
end
