class Task < ApplicationRecord
  belongs_to :subject
  has_many :user_tasks
  has_many :users, through: :user_tasks

  scope :only_id_name_field, ->{select :id, :task_name}
end
