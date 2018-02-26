class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject

  delegate :subject_name, to: :subject
end
