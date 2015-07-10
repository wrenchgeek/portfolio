class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :title, :string
      t.column :description, :string
      t.column :url, :string
    end
  end
end
