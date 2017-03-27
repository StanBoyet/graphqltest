class CreateData < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end

    create_table :posts do |t|
      t.integer :user_id
      t.text :body
      t.timestamps
    end

    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.text :body
      t.timestamps
    end
  end
end
