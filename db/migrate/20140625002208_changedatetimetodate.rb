class Changedatetimetodate < ActiveRecord::Migration
  def change
    remove_column :reminders, :date, :datetime
    add_column :reminders, :date, :date
  end
end
