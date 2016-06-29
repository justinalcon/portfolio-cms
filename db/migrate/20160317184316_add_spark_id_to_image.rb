class AddSparkIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :spark_id, :integer
  end
end
