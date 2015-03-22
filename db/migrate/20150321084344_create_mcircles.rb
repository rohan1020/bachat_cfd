class CreateMcircles < ActiveRecord::Migration
  def change
    create_table :mcircles do |t|
      t.string :number
      t.string :state
      t.string :network

      t.timestamps
    end
  end
end
