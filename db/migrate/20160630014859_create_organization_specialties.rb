class CreateOrganizationSpecialties < ActiveRecord::Migration
  def change
    create_table :organization_specialties do |t|
      t.integer :specialty_id
      t.integer :organization_id
    end
  end
end
