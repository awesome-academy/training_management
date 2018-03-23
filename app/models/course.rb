class Course < ApplicationRecord
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses

  validates :course_name, presence: true

  accepts_nested_attributes_for :course_subjects,
  	reject_if: lambda {|a| a[:subject_id].blank?}, allow_destroy: true

  accepts_nested_attributes_for :user_courses, allow_destroy: true
end
