class UserCourse < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :user_subjects, dependent: :destroy

end
