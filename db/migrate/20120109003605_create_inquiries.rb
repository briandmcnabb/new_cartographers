class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :organization
      t.string :email
      t.string :project_type
      t.string :budget
      t.text :description

      t.timestamps
    end
  end
end
