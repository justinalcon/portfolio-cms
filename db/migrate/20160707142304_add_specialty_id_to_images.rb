class AddSpecialtyIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :specialty_id, :integer
  end
end
