class CreateExpertiseSpecialties < ActiveRecord::Migration
  def change
    create_table :expertise_specialties do |t|
      t.integer :specialty_id
      t.integer :expertise_id
    end
  end
end
