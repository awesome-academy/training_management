class Subject < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :user_subjects
  has_many :user, through: :user_subjects
  has_many :course_subject

  accepts_nested_attributes_for :tasks, reject_if: lambda {|a| a[:tasks_id].blank?}, allow_destroy: true
end
