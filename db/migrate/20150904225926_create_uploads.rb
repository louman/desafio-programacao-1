class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.belongs_to :user
      t.attachment :attachment
      t.timestamps null: false
    end
  end
end
