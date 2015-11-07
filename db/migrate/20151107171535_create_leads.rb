class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :company, null: false
      t.string :job_title
      t.string :phone
      t.string :website
      t.string :status, null: false

      t.timestamps null: false
    end
  end
end
