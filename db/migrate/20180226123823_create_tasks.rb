class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.references :subjects, foreign_key: true

      t.timestamps
    end
  end
end
