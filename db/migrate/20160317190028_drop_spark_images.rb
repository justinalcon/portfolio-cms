class DropSparkImages < ActiveRecord::Migration
  def change
    drop_table :spark_images
  end
end
