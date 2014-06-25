class Changedatetostring < ActiveRecord::Migration
  def change
    remove_column :reminders, :date, :date
    add_column :reminders, :date, :string
  end
end
