class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string    :title
      t.datetime  :date
      t.integer   :time
      t.string    :status
      t.string    :content
      t.string    :phone
      t.timestamps
    end
  end
end
