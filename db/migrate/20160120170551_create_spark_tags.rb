class CreateSparkTags < ActiveRecord::Migration
  def change
    create_table :spark_tags do |t|
      t.integer :tag_id
      t.integer :spark_id
    end
  end
end
