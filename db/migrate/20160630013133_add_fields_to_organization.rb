class AddFieldsToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :dates, :string
    add_column :organizations, :position, :string
    add_column :organizations, :location, :string
    add_column :organizations, :description, :text
  end
end
