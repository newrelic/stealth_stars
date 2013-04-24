class CreateMissionsOperatives < ActiveRecord::Migration
  def up
    create_table :missions_operatives, :id => false do |table|
      table.integer :mission_id
      table.integer :operative_id
    end
  end

  def down
    drop_table :missions_operatives
  end
end
