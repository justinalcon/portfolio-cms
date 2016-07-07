class AddExpertiseIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :expertise_id, :integer
  end
end
