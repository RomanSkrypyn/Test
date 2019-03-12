class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :user
      t.references :currency_from
      t.references :currency_to
      t.float :amount

    end
  end
end
