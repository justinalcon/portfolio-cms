class CreateOrganizationTechnologies < ActiveRecord::Migration
  def change
    create_table :organization_technologies do |t|
      t.integer :organization_id
      t.integer :technology_id
    end
  end
end
