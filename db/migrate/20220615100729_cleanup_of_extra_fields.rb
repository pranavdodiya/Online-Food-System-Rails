class CleanupOfExtraFields < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|
      t.remove :username
      t.remove :full_name
      t.remove :contact_no
      t.remove :address
      t.remove :city
    end
  end
end
