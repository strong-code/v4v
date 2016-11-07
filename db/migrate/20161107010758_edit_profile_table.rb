class EditProfileTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :matched
    add_column :profiles, :match, :string
  end
end
