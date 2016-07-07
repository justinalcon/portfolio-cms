class AddOrganizationIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :organization_id, :integer
  end
end
