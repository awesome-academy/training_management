class CreateUserSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :user_subjects do |t|
      t.references :user, foreign_key: true
      t.references :subjects, foreign_key: true

      t.timestamps
    end
  end
end
