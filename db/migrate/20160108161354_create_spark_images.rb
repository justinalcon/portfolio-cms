class CreateSparkImages < ActiveRecord::Migration
  def change
    create_table :spark_images do |t|
      t.integer :image_id
      t.integer :spark_id
    end
  end
end
