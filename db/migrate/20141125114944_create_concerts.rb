class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.date :date
      t.string :town
      t.string :country
      t.string :hall
      t.string :works_by
      t.string :description

      t.timestamps
    end
  end
end
