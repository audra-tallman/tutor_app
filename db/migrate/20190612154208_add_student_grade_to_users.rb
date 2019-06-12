class AddStudentGradeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :student_grade, :integer
  end
end
