class RemoveStudentGradeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :student_grade, :string
  end
end
