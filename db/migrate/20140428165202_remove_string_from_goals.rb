class RemoveStringFromGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :string, :string
  end
end
