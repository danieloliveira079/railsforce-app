class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.string :client_email
      t.string :client_id
      t.string :client_secret
      t.boolean :active

      t.timestamps null: false
    end
  end
end
