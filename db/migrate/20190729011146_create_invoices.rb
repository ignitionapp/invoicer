class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|

      t.text :name
      t.integer :total_cents
      t.json :line_items

      t.timestamps
    end
  end
end
