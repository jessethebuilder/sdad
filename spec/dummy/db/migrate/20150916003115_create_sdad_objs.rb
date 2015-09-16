class CreateSdadObjs < ActiveRecord::Migration
  def change
    create_table :sdad_objs do |t|
      t.boolean :published
      t.boolean :archived

      t.timestamps null: false
    end
  end
end
