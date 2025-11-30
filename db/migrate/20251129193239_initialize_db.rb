class InitializeDb < ActiveRecord::Migration[8.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.timestamps
    end

    create_table :officers do |t|
      t.string :name
      t.timestamps
    end

    create_table :roles do |t|
      t.belongs_to :business
      t.belongs_to :officer
      t.string :name
      t.timestamps
    end
  end
end
