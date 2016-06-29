class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.string :name
    end
  end
end
