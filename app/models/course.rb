class Course < ApplicationRecord
  has_many :course_subjects
  has_many :subjects, through: :course_subjects
  has_many :user_courses
  has_many :users, through: :user_courses

  accepts_nested_attributes_for :course_subjects,
  	reject_if: lambda {|a| a[:subject_id].blank?}, allow_destroy: true
end
