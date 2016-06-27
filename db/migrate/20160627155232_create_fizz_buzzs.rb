class CreateFizzBuzzs < ActiveRecord::Migration
  def change
    create_table :fizz_buzzs do |t|
      t.integer :number
      t.string :value

      t.timestamps null: false
    end
  end
end
