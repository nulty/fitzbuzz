class CreateUsersFizzbuzzs < ActiveRecord::Migration
  def change
    create_table :users_fizz_buzzs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :fizz_buzz, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
