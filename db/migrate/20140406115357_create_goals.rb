class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.string :description
      t.string :string
      t.references :user, index: true

      t.timestamps
    end
  end
end
