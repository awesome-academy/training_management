class CreateCourseSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :course_subjects do |t|
      t.references :course, foreign_key: true
      t.references :subjects, foreign_key: true

      t.timestamps
    end
  end
end
