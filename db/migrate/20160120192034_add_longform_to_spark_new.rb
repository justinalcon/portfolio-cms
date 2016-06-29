class AddLongformToSparkNew < ActiveRecord::Migration
  def up
    change_column :sparks, :longform, :text
  end

  def down 
  	change_column :sparks, :longform, :text
  end
end
