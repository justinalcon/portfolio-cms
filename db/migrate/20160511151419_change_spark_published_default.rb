class ChangeSparkPublishedDefault < ActiveRecord::Migration
  def change
    change_column_default :sparks, :published, true
  end
end
