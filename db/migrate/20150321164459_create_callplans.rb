class CreateCallplans < ActiveRecord::Migration
  def change
    create_table :callplans do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :network
      t.string :state
      t.integer :plantype
      t.string :ratepersec
      t.string :ratepermin
      t.string :ratepersec_std
      t.string :ratepermin_std

      t.timestamps
    end
  end
end
