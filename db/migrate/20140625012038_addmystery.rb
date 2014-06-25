class Addmystery < ActiveRecord::Migration
  def change
    remove_column :reminders, :realdate, :string
    add_column :reminders, :mystery, :string
  end
end
