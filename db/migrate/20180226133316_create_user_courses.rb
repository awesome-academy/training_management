class CreateUserCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_courses do |t|
      t.references :courses, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
