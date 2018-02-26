class Course < ApplicationRecord
  has_many :course_subjects
  has_many :subjects, through: :course_subjects
  has_many :user_courses
  has_many :users, through: :user_courses
end
