class AddTechnologiesIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :technology_id, :integer
  end
end
