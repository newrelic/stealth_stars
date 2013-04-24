class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :codename

      t.timestamps
    end
  end
end
