class CreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :bio
    end
  end
end
