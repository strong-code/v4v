class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :candidate
      t.string :state
      t.boolean :matched
      t.boolean :completed
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
