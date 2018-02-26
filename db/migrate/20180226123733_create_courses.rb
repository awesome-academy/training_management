class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.integer :trainee_number
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
