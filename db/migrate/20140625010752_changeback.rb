class Changeback < ActiveRecord::Migration
  def change
    remove_column :reminders, :date, :string
    add_column :reminders, :date, :date
  end
end
