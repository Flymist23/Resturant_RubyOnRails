class CreateResturants < ActiveRecord::Migration[5.2]
  def change
    create_table :resturants do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
