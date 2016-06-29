class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :location
    end
  end
end
