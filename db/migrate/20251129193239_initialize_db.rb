class InitializeDb < ActiveRecord::Migration[8.1]
  def change
    # create_table :businesses do |t|
    #   t.string :name
    #   t.timestamps
    # end
    #
    # create_table :roles do |t|
    #   t.string :name
    #   t.timestamps
    # end
    #
    # create_table :officers do |t|
    #   t.string :name
    #   t.timestamps
    # end
    #
    # create_table :associations, id: false do |t|
    #   t.belongs_to :business, foreign_key: true
    #   t.belongs_to :officer, foreign_key: true
    #   t.belongs_to :role, foreign_key: true
    # end
    #
    # add_index :associations, [:business_id, :officer_id, :role_id], unique: true

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
