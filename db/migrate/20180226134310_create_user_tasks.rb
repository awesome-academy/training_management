class CreateUserTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tasks do |t|
      t.references :task, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
