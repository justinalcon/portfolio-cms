class CreateSpecialtyTechnologies < ActiveRecord::Migration
  def change
    create_table :specialty_technologies do |t|
      t.integer :specialty_id
      t.integer :technology_id
    end
  end
end
