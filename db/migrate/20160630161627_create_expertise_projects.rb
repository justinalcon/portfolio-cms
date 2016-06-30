class CreateExpertiseProjects < ActiveRecord::Migration
  def change
    create_table :expertise_projects do |t|
      t.integer :project_id
      t.integer :expertise_id
    end
  end
end
