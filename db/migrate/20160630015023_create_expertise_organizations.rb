class CreateExpertiseOrganizations < ActiveRecord::Migration
  def change
    create_table :expertise_organizations do |t|
      t.integer :organization_id
      t.integer :expertise_id
    end
  end
end
