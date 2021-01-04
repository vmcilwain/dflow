class CreateContactMes < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_mes do |t|

      t.timestamps
    end
  end
end
