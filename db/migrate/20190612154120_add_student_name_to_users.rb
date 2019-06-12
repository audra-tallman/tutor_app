class AddStudentNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :student_name, :string
  end
end
