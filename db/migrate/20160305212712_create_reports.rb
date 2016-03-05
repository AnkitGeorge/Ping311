class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :address
      t.text :description
      t.integer :status

      t.timestamps null: false
    end
  end
end
