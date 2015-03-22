class CreateCalllogs < ActiveRecord::Migration
  def change
    create_table :calllogs do |t|
      t.integer :user_id
      t.string :caller
      t.integer :duration
      t.datetime :called_on

      t.timestamps
    end
  end
end
