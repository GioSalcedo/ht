class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.string :nit
      t.string :contact_person
      t.string :phone_number
      t.references :bank, null: false, foreign_key: true
      t.string :account_number

      t.timestamps
    end
  end
end
