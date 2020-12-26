class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # t.string :name # -> name varchar(255) nullable
      t.string :name, limit: 100, null: false, comment: 'ユーザの名前'
      t.string :email, null: false, comment: 'ユーザのメールアドレス'

      t.timestamps
    end
    add_index :users, [:email], unique: true
  end
end
