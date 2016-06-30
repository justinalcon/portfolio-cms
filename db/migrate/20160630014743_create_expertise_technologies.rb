class CreateExpertiseTechnologies < ActiveRecord::Migration
  def change
    create_table :expertise_technologies do |t|
      t.integer :expertise_id
      t.integer :technology_id
    end
  end
end
