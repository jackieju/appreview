class CreateApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
            t.string :appid
            t.string :name
            t.string :desc
            t.integer :uid
            t.string :ver
            t.integer :st  # review status
            t.text  :prop
            

          t.timestamps
        end

        add_index(:apps, ["appid"], {:unique=>true})
        add_index(:apps, ["name"], {:unique=>true})
  end

  def self.down
    drop_table :apps
  end
end
