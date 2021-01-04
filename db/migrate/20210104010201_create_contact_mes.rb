class CreateContactMes < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_mes do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.text :message

      t.timestamps
    end
  end
end
