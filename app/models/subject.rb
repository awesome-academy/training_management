class Subject < ApplicationRecord
  has_many :tasks
  has_many :user_subjects
  has_many :user, through: :user_subjects
  has_many :course_subject
end
