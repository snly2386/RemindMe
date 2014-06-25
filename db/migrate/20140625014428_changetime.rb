class Changetime < ActiveRecord::Migration
  def change
    remove_column :reminders, :time, :integer
    add_column :reminders, :time, :time
    add_column :reminders, :tim, :string
  end
end
