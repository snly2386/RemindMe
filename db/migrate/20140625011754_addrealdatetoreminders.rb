class Addrealdatetoreminders < ActiveRecord::Migration
  def change
    add_column :reminders, :realdate, :string
  end
end
