class Subject < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :user_subjects
  has_many :user, through: :user_subjects
  has_many :course_subject

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  validates :subject_name, presence: true

  scope :only_id_name_field, -> {select :id, :subject_name}
end
